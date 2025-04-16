using Microsoft.AspNetCore.Http.Json;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using server.Models;
using server.Services;
using System.Text.Json;

var builder = WebApplication.CreateBuilder(args);

var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
NpgsqlDataSource dataSource = NpgsqlDataSource.Create(connectionString);
builder.Services.AddSingleton(dataSource);

// Sessions
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

// Email service
builder.Services.AddScoped<IEmailService, EmailService>();

var app = builder.Build();
app.UseSession();

// Health check
app.MapGet("/api/health", () => Results.Ok(new { status = "OK", timestamp = DateTime.UtcNow }));

// Login
app.MapPost("/api/login", async (HttpContext context, LoginRequest login, NpgsqlDataSource db) =>
{
    await using var cmd = db.CreateCommand(@"
        SELECT ""Id"", first_name, company, role_id, email
        FROM users
        WHERE (email = @login OR LOWER(TRIM(first_name)) = LOWER(TRIM(@login)))
        AND password = @password");

    cmd.Parameters.AddWithValue("login", login.Username);
    cmd.Parameters.AddWithValue("password", login.Password);

    await using var reader = await cmd.ExecuteReaderAsync();
    if (await reader.ReadAsync())
    {
        var userId = reader.GetInt32(0);
        var firstName = reader.GetString(1);
        var company = reader.GetString(2);
        var roleId = reader.IsDBNull(3) ? 1 : reader.GetInt32(3);
        var email = reader.GetString(4);

        var role = roleId switch
        {
            1 => "staff",
            2 => "admin",
            3 => "admin",
            _ => "staff"
        };

        context.Session.SetString("userId", userId.ToString());
        context.Session.SetString("userFirstName", firstName);
        context.Session.SetString("userCompany", company);
        context.Session.SetString("userRole", role);
        context.Session.SetString("userEmail", email);

        return Results.Ok(new
        {
            success = true,
            user = new { id = userId, username = firstName, company, role, email }
        });
    }

    return Results.Unauthorized();
});

// Logout
app.MapPost("/api/logout", (HttpContext context) =>
{
    context.Session.Clear();
    return Results.Ok(new { success = true, message = "Utloggad" });
});

// Create user
app.MapPost("/api/users", async ([FromBody] UserForm user, NpgsqlDataSource db, IEmailService emailService) =>
{
    try
    {
        int roleId = user.Role?.ToLower() switch
        {
            "super-admin" => 3,
            "admin" => 2,
            "staff" => 1,
            _ => 1
        };

        user.CreatedAt = DateTime.UtcNow;

        await using var cmd = db.CreateCommand(@"
            INSERT INTO users (first_name, password, company, created_at, role_id, email)
            VALUES (@first_name, @password, @company, @created_at, @role_id, @email)
            RETURNING ""Id"", first_name, company, created_at");

        cmd.Parameters.AddWithValue("first_name", user.FirstName);
        cmd.Parameters.AddWithValue("password", user.Password);
        cmd.Parameters.AddWithValue("company", user.Company);
        cmd.Parameters.AddWithValue("created_at", user.CreatedAt);
        cmd.Parameters.AddWithValue("role_id", roleId);
        cmd.Parameters.AddWithValue("email", user.Email);

        await using var reader = await cmd.ExecuteReaderAsync();
        if (await reader.ReadAsync())
        {
            await emailService.SendChangePasswordLink(user.Email, user.FirstName, user.Password);

            return Results.Ok(new
            {
                message = "Användare skapad",
                user = new
                {
                    Id = reader.GetInt32(0),
                    FirstName = reader.GetString(1),
                    Company = reader.GetString(2),
                    CreatedAt = reader.GetDateTime(3)
                }
            });
        }

        return Results.BadRequest(new { message = "Kunde inte skapa användare" });
    }
    catch (Exception ex)
    {
        return Results.BadRequest(new { message = "Ett fel uppstod", error = ex.Message });
    }
});

// Update user
app.MapPut("/api/users/{userId}", async (HttpContext context, [FromBody] UserForm user, NpgsqlDataSource db) =>
{
    try
    {
        var currentUserId = context.Session.GetString("userId");
        if (string.IsNullOrEmpty(currentUserId))
            return Results.Unauthorized();

        await using var cmd = db.CreateCommand(@"
            UPDATE users
            SET first_name = CASE WHEN @first_name = '' THEN first_name ELSE @first_name END,
                password = CASE WHEN @password = '' THEN password ELSE @password END
            WHERE ""Id"" = @userId AND ""Id"" = @currentUserId
            RETURNING ""Id"", first_name");

        cmd.Parameters.AddWithValue("userId", int.Parse(currentUserId));
        cmd.Parameters.AddWithValue("currentUserId", int.Parse(currentUserId));
        cmd.Parameters.AddWithValue("first_name", user.FirstName ?? "");
        cmd.Parameters.AddWithValue("password", user.Password ?? "");

        await using var reader = await cmd.ExecuteReaderAsync();
        if (await reader.ReadAsync())
        {
            if (!string.IsNullOrEmpty(user.FirstName))
            {
                context.Session.SetString("userFirstName", user.FirstName);
            }

            return Results.Ok(new
            {
                message = "Uppgifterna uppdaterades framgångsrikt",
                user = new
                {
                    Id = reader.GetInt32(0),
                    FirstName = reader.GetString(1)
                }
            });
        }

        return Results.NotFound(new { message = "Användare hittades inte" });
    }
    catch (Exception ex)
    {
        return Results.BadRequest(new { message = ex.Message });
    }
});

// Delete user
app.MapDelete("/api/users/{userId}", async (int userId, NpgsqlDataSource db) =>
{
    try
    {
        await using var cmd = db.CreateCommand("DELETE FROM users WHERE \"Id\" = @userId");
        cmd.Parameters.AddWithValue("userId", userId);
        var affected = await cmd.ExecuteNonQueryAsync();
        return affected > 0
            ? Results.Ok(new { message = "Användare borttagen" })
            : Results.NotFound(new { message = "Användare hittades inte" });
    }
    catch (Exception ex)
    {
        return Results.BadRequest(new { message = ex.Message });
    }
});

app.Run();

record LoginRequest(string Username, string Password);