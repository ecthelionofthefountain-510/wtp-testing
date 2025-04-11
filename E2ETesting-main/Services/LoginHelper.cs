using Microsoft.Playwright;
using System.Threading.Tasks;

namespace E2ETesting.Helpers
{
    public static class LoginHelper
    {
        public static async Task LoginAsAdminAsync(IPage page)
        {
            await page.GotoAsync("http://localhost:3001/");
            await page.ClickAsync("[class='navbar-right']");
            await page.FillAsync("input.staff-field-input[type='text']", "KevinAdmin");
            await page.FillAsync("input.staff-field-input[type='password']", "abc123");
            await page.ClickAsync("button.staff-login-button");

            // Vänta tills admin dashboard har laddats in
            await page.WaitForURLAsync("**/admin/dashboard", new() { Timeout = 10000 });
        }

        public static async Task LoginAsStaffAsync(IPage page)
        {
            await page.GotoAsync("http://localhost:3001/");
            await page.ClickAsync("[class='navbar-right']");
            await page.FillAsync("input.staff-field-input[type='text']", "KevinStaff");
            await page.FillAsync("input.staff-field-input[type='password']", "abc123");
            await page.ClickAsync("button.staff-login-button");

            // Vänta tills staff dashboard har laddats in
            await page.WaitForURLAsync("**/staff/dashboard", new() { Timeout = 10000 });
        }
    }
}