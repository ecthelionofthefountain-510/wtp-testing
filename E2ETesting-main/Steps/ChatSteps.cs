// ChatSteps.cs
using Microsoft.Playwright;
using TechTalk.SpecFlow;
using Xunit;
using E2ETesting.Helpers;

namespace E2ETesting.Steps;

[Binding]
[Scope(Feature = "Realtime Chat Communication")]
public class ChatSteps
{
    private readonly ScenarioContext _scenarioContext;
    private IPage _customerPage;
    private IPage _staffPage;

    private const string BaseUrl = "http://localhost:3001";

    public ChatSteps(ScenarioContext scenarioContext)
    {
        _scenarioContext = scenarioContext;
    }

    [Given("the customer submits a support form with a message")]
    public async Task GivenCustomerSubmitsForm()
    {
        var browser = _scenarioContext.Get<IBrowser>("Browser");
        _customerPage = await browser.NewPageAsync();
        _scenarioContext["CustomerPage"] = _customerPage;

        await _customerPage.GotoAsync($"{BaseUrl}/");
        await _customerPage.FillAsync("input[name='name']", "Testkund");
        await _customerPage.FillAsync("input[name='email']", "kund@example.com");
        await _customerPage.FillAsync("textarea[name='message']", "Hej, jag behöver hjälp!");
        await _customerPage.SelectOptionAsync("select[name='company']", "tele");
        await _customerPage.ClickAsync("button.send-ticket-button");
        await _customerPage.WaitForSelectorAsync("text=Formulär skickat", new() { Timeout = 10000 });
    }

    [When("the customer opens the chat from the email link")]
    public async Task WhenCustomerOpensChat()
    {
        _customerPage = _scenarioContext.Get<IPage>("CustomerPage");
        await _customerPage.ReloadAsync();
        var chatLink = _customerPage.Locator("a:has-text('gå till chatten')");
        await chatLink.WaitForAsync(new() { Timeout = 15000 });
        await chatLink.ClickAsync();
        await _customerPage.WaitForSelectorAsync("text=Hej, jag behöver hjälp!", new() { Timeout = 10000 });
    }

    [When("the staff logs in and opens the same chat")]
    public async Task WhenStaffLogsIn()
    {
        var browser = _scenarioContext.Get<IBrowser>("Browser");
        _staffPage = await browser.NewPageAsync();
        _scenarioContext["StaffPage"] = _staffPage;

        await LoginHelper.LoginAsStaffAsync(_staffPage);
        await _staffPage.ClickAsync("a[href='/staff/chat']");
        await _staffPage.WaitForSelectorAsync("text=Hej, jag behöver hjälp!", new() { Timeout = 10000 });
    }

    [When("the staff responds to the message")]
    public async Task WhenStaffResponds()
    {
        _staffPage = _scenarioContext.Get<IPage>("StaffPage");
        await _staffPage.FillAsync("textarea[name='message']", "Hej, vi hjälper dig strax!");
        await _staffPage.ClickAsync("button.send-chat-button");
    }

    [Then("the customer should see the staff's response")]
    public async Task ThenCustomerSeesResponse()
    {
        _customerPage = _scenarioContext.Get<IPage>("CustomerPage");
        await _customerPage.WaitForSelectorAsync("text=Hej, vi hjälper dig strax!", new() { Timeout = 10000 });
    }

    [Then("the message should be visible in the chat")]
    public async Task ThenTheMessageShouldBeVisibleInTheChat()
    {
        _customerPage = _scenarioContext.Get<IPage>("CustomerPage");
        var messageVisible = await _customerPage.IsVisibleAsync("text=Hej, jag behöver hjälp!");
        Assert.True(messageVisible);
    }

    [Then("the staff should see the customer's message")]
    public async Task ThenTheStaffShouldSeeTheCustomersMessage()
    {
        _staffPage = _scenarioContext.Get<IPage>("StaffPage");
        var messageVisible = await _staffPage.IsVisibleAsync("text=Hej, jag behöver hjälp!");
        Assert.True(messageVisible);
    }
}
