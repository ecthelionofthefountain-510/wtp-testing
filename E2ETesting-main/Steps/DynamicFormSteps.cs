// DynamicFormSteps.cs

using Microsoft.Playwright;
using TechTalk.SpecFlow;
using Xunit;
using FluentAssertions;

namespace E2ETesting.Steps;

[Binding]
public class DynamicFormSteps
{
    private readonly ScenarioContext _scenarioContext;
    private IPage _page;

    public DynamicFormSteps(ScenarioContext scenarioContext)
    {
        _scenarioContext = scenarioContext;
        _page = _scenarioContext.Get<IPage>("Page");
    }

    [Given("I am on the support form page")]
    public async Task GivenIAmOnTheSupportFormPage()
    {
        await _page.GotoAsync("http://localhost:3001/");
    }

    [When(@"I choose (.*) from the company dropdown")]
    public async Task WhenIChooseCompany(string company)
    {
        var dropdown = await _page.QuerySelectorAsync("select[name='companyType']");
        dropdown.Should().NotBeNull("Expected to find the company dropdown");

        // Vänta max 5 sekunder på att rätt option ska dyka upp
        bool optionFound = false;

        for (int i = 0; i < 10; i++) // 10 × 500ms = 5s
        {
            var options = await dropdown.QuerySelectorAllAsync("option");
            foreach (var opt in options)
            {
                var text = (await opt.InnerTextAsync())?.Trim();
                if (text != null && text.Equals(company.Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    optionFound = true;
                    break;
                }
            }

            if (optionFound) break;
            await _page.WaitForTimeoutAsync(500);
        }

        optionFound.Should().BeTrue($"Expected option '{company}' to exist in dropdown");

        await dropdown.SelectOptionAsync(new SelectOptionValue { Label = company });
    }

    [When(@"I enter (.*) as name")]
    public async Task WhenIEnterName(string name)
    {
        await _page.FillAsync("input[name='firstName']", name);
    }

    [When(@"I enter (.*) as email")]
    public async Task WhenIEnterEmail(string email)
    {
        await _page.FillAsync("input[name='email']", email);
    }

    [When(@"I choose (.*) as service type")]
    public async Task WhenIChooseService(string service)
    {
        await _page.SelectOptionAsync("select[name='serviceType']", new SelectOptionValue { Label = service });
    }

    [When(@"I choose (.*) as issue type")]
    public async Task WhenIChooseIssue(string issue)
    {
        await _page.SelectOptionAsync("select[name='issueType']", new SelectOptionValue { Label = issue });
    }

    [When(@"I enter (.*) as message")]
    public async Task WhenIEnterMessage(string message)
    {
        await _page.FillAsync("textarea[name='message']", message);
    }

    [When("I submit the support form")]
    public async Task WhenISubmitTheForm()
    {
        await _page.ClickAsync("button[type='submit']");
    }

    [Then("I should see the confirmation message")]
    public async Task ThenIShouldSeeConfirmationMessage()
    {
        var locator = _page.Locator("text=Formulär skickat! Kolla din e-post för chattlänken");
        await locator.WaitForAsync(new() { State = WaitForSelectorState.Visible, Timeout = 5000 });
        Assert.True(await locator.IsVisibleAsync());
    }
}