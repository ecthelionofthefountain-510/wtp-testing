using Microsoft.Playwright;
using TechTalk.SpecFlow;
using Xunit;
using FluentAssertions;

namespace E2ETesting.Steps;

[Binding]
public class TicketManagementSteps
{
    private readonly ScenarioContext _scenarioContext;
    private readonly IPage _page;
    private string _selectedTicketTimestamp;

    public TicketManagementSteps(ScenarioContext scenarioContext)
    {
        _scenarioContext = scenarioContext;
        _page = _scenarioContext.Get<IPage>("Page");
    }

    private string GetContainerSelector(string columnName) =>
        columnName switch
        {
            "Ärenden" => ".ticket-tasks",
            "Mina ärenden" => ".ticket-my-tasks",
            "Klara" => ".ticket-done",
            _ => throw new ArgumentException($"Okänd kolumn: {columnName}")
        };

    [Given("I see a ticket in the (.*) column")]
    public async Task GivenISeeATicketInTheColumn(string columnName)
    {
        var containerSelector = GetContainerSelector(columnName);
        var ticketSelector = $"{containerSelector} .ticket-items-container .ticket-task-item";

        await _page.WaitForSelectorAsync(containerSelector, new() { Timeout = 10000 });

        var ticket = await _page.WaitForSelectorAsync(ticketSelector, new()
        {
            Timeout = 10000,
            State = WaitForSelectorState.Visible
        });

        ticket.Should().NotBeNull($"Expected a ticket in column '{columnName}'");

        var timeElement = await ticket.QuerySelectorAsync(".ticket-task-time");
        _selectedTicketTimestamp = (await timeElement.InnerTextAsync()).Trim();
    }

    [When("I drag the ticket to the (.*) column")]
    public async Task WhenIDragTheTicketToTheColumn(string targetColumn)
    {
        var sourceTicket = await FindTicketByTimestamp(_selectedTicketTimestamp);
        var targetSelector = GetContainerSelector(targetColumn);
        var target = await _page.QuerySelectorAsync(targetSelector);

        var boxSource = await sourceTicket.BoundingBoxAsync();
        var boxTarget = await target.BoundingBoxAsync();

        if (boxSource != null && boxTarget != null)
        {
            await _page.Mouse.MoveAsync(boxSource.X + boxSource.Width / 2, boxSource.Y + boxSource.Height / 2);
            await _page.Mouse.DownAsync();
            await _page.Mouse.MoveAsync(boxTarget.X + boxTarget.Width / 2, boxTarget.Y + boxTarget.Height / 2, new MouseMoveOptions { Steps = 10 });
            await _page.Mouse.UpAsync();
        }

        await _page.WaitForTimeoutAsync(1000);
    }

    [When("I drag the same ticket to the (.*) column")]
    public async Task WhenIDragTheSameTicketToTheColumn(string columnName)
    {
        await WhenIDragTheTicketToTheColumn(columnName);
    }

    [Then("the ticket should appear in the (.*) column")]
    public async Task ThenTheTicketShouldAppearInTheColumn(string columnName)
    {
        var containerSelector = GetContainerSelector(columnName);
        var ticketSelector = $"{containerSelector} .ticket-task-item";

        await _page.WaitForSelectorAsync(ticketSelector, new() { Timeout = 10000 });

        bool found = false;
        for (int i = 0; i < 10; i++)
        {
            var tickets = await _page.QuerySelectorAllAsync(ticketSelector);

            foreach (var ticket in tickets)
            {
                var timeElement = await ticket.QuerySelectorAsync(".ticket-task-time");
                var timeText = (await timeElement?.InnerTextAsync())?.Trim();
                if (timeText == _selectedTicketTimestamp)
                {
                    found = true;
                    break;
                }
            }

            if (found) break;
            await _page.WaitForTimeoutAsync(500);
        }

        found.Should().BeTrue($"Expected ticket to appear in column '{columnName}'");
    }

    [Then("the ticket should not appear in the (.*) or (.*) columns")]
    public async Task ThenTheTicketShouldNotAppearInTheOrColumns(string col1, string col2)
    {
        foreach (var col in new[] { col1, col2 })
        {
            var containerSelector = GetContainerSelector(col);
            var ticketSelector = $"{containerSelector} .ticket-task-item";
            var tickets = await _page.QuerySelectorAllAsync(ticketSelector);

            foreach (var ticket in tickets)
            {
                var timeElement = await ticket.QuerySelectorAsync(".ticket-task-time");
                var timeText = (await timeElement?.InnerTextAsync())?.Trim();
                timeText.Should().NotBe(_selectedTicketTimestamp, $"Expected NO ticket in '{col}' column.");
            }
        }
    }

    private async Task<IElementHandle> FindTicketByTimestamp(string timestamp)
    {
        var allTickets = await _page.QuerySelectorAllAsync(".ticket-task-item");

        foreach (var ticket in allTickets)
        {
            var timeElement = await ticket.QuerySelectorAsync(".ticket-task-time");
            var timeText = (await timeElement?.InnerTextAsync())?.Trim();

            if (timeText == timestamp)
            {
                return ticket;
            }
        }

        throw new Exception($"Ticket with timestamp '{timestamp}' not found.");
    }
}
