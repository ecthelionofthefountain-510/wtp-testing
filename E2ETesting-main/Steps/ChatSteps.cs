using Microsoft.Playwright;
using TechTalk.SpecFlow;
using Xunit;
using System.Text.Json;
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
        await _customerPage.SelectOptionAsync("select[name='companyType']", new SelectOptionValue { Label = "Tele/Bredband" });
        await _customerPage.FillAsync("input[name='firstName']", "Testkund");
        await _customerPage.FillAsync("input[name='email']", "kund@example.com");
        await _customerPage.SelectOptionAsync("select[name='serviceType']", new SelectOptionValue { Label = "Bredband" });
        await _customerPage.SelectOptionAsync("select[name='issueType']", new SelectOptionValue { Label = "Tekniskt problem" });
        await _customerPage.FillAsync("textarea[name='message']", "Hej, jag behöver hjälp!");

        var responseTask = _customerPage.WaitForResponseAsync(r =>
            r.Url.Contains("/api/tele") && r.Status == 200);

        await _customerPage.ClickAsync("button[type='submit']");

        var response = await responseTask;
        var json = await response.JsonAsync();
        var jsonElement = (JsonElement)json;

        // Vänta på bekräftelse
        var confirmation = _customerPage.Locator("text=Formulär skickat!");
        await confirmation.WaitForAsync(new() { Timeout = 5000 });
        Assert.True(await confirmation.IsVisibleAsync());

        // Plocka ut chatToken från "submission"
        if (!jsonElement.TryGetProperty("submission", out var submissionElement) ||
            !submissionElement.TryGetProperty("chatToken", out var tokenElement))
        {
            throw new Exception("chatToken saknas i svaret från API:t");
        }

        var chatToken = tokenElement.GetString();
        _scenarioContext["ChatToken"] = chatToken;
    }

    [When("the customer opens the chat from the email link")]
    public async Task WhenCustomerOpensChat()
    {
        _customerPage = _scenarioContext.Get<IPage>("CustomerPage");
        var chatToken = _scenarioContext.Get<string>("ChatToken");

        await _customerPage.GotoAsync($"{BaseUrl}/chat/{chatToken}");
        await _customerPage.WaitForSelectorAsync("text=Hej, jag behöver hjälp!", new() { Timeout = 10000 });
    }

    [Then("the message should be visible in the chat")]
    public async Task ThenTheMessageShouldBeVisibleInTheChat()
    {
        _customerPage = _scenarioContext.Get<IPage>("CustomerPage");
        var messageVisible = await _customerPage.IsVisibleAsync("text=Hej, jag behöver hjälp!");
        Assert.True(messageVisible);
    }

    [When("the staff logs in and opens the same chat")]
    public async Task WhenStaffLogsIn()
    {
        var browser = _scenarioContext.Get<IBrowser>("Browser");
        _staffPage = await browser.NewPageAsync();
        _scenarioContext["StaffPage"] = _staffPage;

        var chatToken = _scenarioContext.Get<string>("ChatToken");

        await LoginHelper.LoginAsStaffAsync(_staffPage);
        await _staffPage.GotoAsync($"{BaseUrl}/chat/{chatToken}");
        await _staffPage.WaitForSelectorAsync("text=Hej, jag behöver hjälp!", new() { Timeout = 10000 });
    }

    [Then("the staff should see the customer's message")]
    public async Task ThenTheStaffShouldSeeTheCustomersMessage()
    {
        _staffPage = _scenarioContext.Get<IPage>("StaffPage");
        var visible = await _staffPage.IsVisibleAsync("text=Hej, jag behöver hjälp!");
        Assert.True(visible);
    }

    [When("the staff responds to the message")]
    public async Task WhenStaffResponds()
    {
        _staffPage = _scenarioContext.Get<IPage>("StaffPage");
        await _staffPage.FillAsync("input[type='text']", "Hej, vi hjälper dig strax!");
        await _staffPage.WaitForSelectorAsync(".chat-modal__send-button", new() { Timeout = 10000 });
    }

    [Then("the customer should see the staff's response")]
    public async Task ThenCustomerSeesResponse()
    {
        _customerPage = _scenarioContext.Get<IPage>("CustomerPage");
        await _customerPage.WaitForSelectorAsync("text=Hej, vi hjälper dig strax!", new() { Timeout = 10000 });
    }
}