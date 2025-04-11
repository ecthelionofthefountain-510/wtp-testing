// LoginSteps.cs
using Microsoft.Playwright;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using Xunit;
using E2ETesting.Helpers;

namespace E2ETesting.Steps;

[Binding]
public class LoginSteps
{
    private readonly ScenarioContext _scenarioContext;
    private readonly IPage _page;

    public LoginSteps(ScenarioContext scenarioContext)
    {
        _scenarioContext = scenarioContext;
        _page = _scenarioContext.Get<IPage>("Page"); 
    }

    [Given("I am logged in as an admin")]
    public async Task GivenIAmLoggedInAsAdmin()
    {
        await LoginHelper.LoginAsAdminAsync(_page);
    }

    [Given("I am logged in as staff")]
    public async Task GivenIAmLoggedInAsStaff()
    {
        await LoginHelper.LoginAsStaffAsync(_page);
    }

    [Given("I am at the WTP homepage")]
    public async Task GivenIAmAtTheWtpHomepage()
    {
        await _page.GotoAsync("http://localhost:3001/");
    }

    [Given("I see the navbar login button")]
    public async Task GivenISeeTheNavBarLoginButton()
    {
        await _page.Locator("[class='navbar-right']").WaitForAsync(new() { State = WaitForSelectorState.Visible, Timeout = 5000 });
    }

    [When("I click on the navbar login button")]
    public async Task WhenIClickTheNavBarLoginButton()
    {
        await _page.ClickAsync("[class='navbar-right']");
    }

    [Then("I should see the login form")]
    public async Task ThenIShouldSeeTheLoginForm()
    {
        await _page.Locator("[class='staff-login-title']").WaitForAsync(new() { State = WaitForSelectorState.Visible, Timeout = 5000 });
    }

    [When("I fill in the form with valid data")]
    public async Task WhenIFillInTheFormWithValidData()
    {
        await _page.FillAsync("input.staff-field-input[type='text']", "KevinAdmin");
        await _page.FillAsync("input.staff-field-input[type='password']", "abc123");
    }

    [When("I click on the login form button")]
    public async Task WhenIClickOnTheLoginFormButton()
    {
        await _page.ClickAsync("button.staff-login-button");
    }

    [Then("I should be logged in")]
    public async Task ThenIShouldBeLoggedIn()
    {
        await _page.WaitForURLAsync("**/admin/dashboard", new() { Timeout = 5000 });
        Assert.Contains("/admin/dashboard", _page.Url);
    }
}
