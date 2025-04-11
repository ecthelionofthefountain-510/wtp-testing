// AdminCreateUserSteps.cs
using E2ETesting.Helpers;
using Microsoft.Playwright;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using Xunit;

namespace E2ETesting.Steps;

[Binding]
[Scope(Feature = "Admin Create User")]
public class AdminCreateUserSteps
{
    private readonly ScenarioContext _scenarioContext;

    public AdminCreateUserSteps(ScenarioContext scenarioContext)
    {
        _scenarioContext = scenarioContext;
    }
    
    [Given("I am logged in as an admin")]
    public async Task GivenIAmLoggedInAsAnAdmin()
    {
        var page = _scenarioContext.Get<IPage>("Page");
        await LoginHelper.LoginAsAdminAsync(page);
    }

    [Given("I navigate to the create user page")]
    public async Task GivenINavigateToTheCreateUserPage()
    {
        var page = _scenarioContext.Get<IPage>("Page");
        
        // Klicka på "Create User"-knappen från dashboard
        await page.ClickAsync("text=Create User");
        
        // Alternativ: navigera direkt
        // await page.GotoAsync("http://localhost:3001/admin/create-user");
        
        // Vänta på att sidan laddas
        await page.WaitForURLAsync("**/admin/create-user");
    }
    
    [When("I fill in all required fields with valid data")]
    public async Task WhenIFillInAllRequiredFieldsWithValidData()
    {
        var page = _scenarioContext.Get<IPage>("Page");
        await page.FillAsync("input[name='email']", "test.user@example.com");
        await page.FillAsync("input[name='firstName']", "Test User");
        await page.FillAsync("input[name='password']", "SecurePass123");

        // Välj företag med specifikt värde
        await page.SelectOptionAsync("select[name='company']", new SelectOptionValue { Value = "fordon" });

        // Välj roll med specifikt värde
        await page.SelectOptionAsync("select[name='role']", new SelectOptionValue { Value = "staff" });
    }

    [When(@"I fill in the email field with (.*)")]
    public async Task WhenIFillInTheEmailFieldWith(string email)
    {
        var page = _scenarioContext.Get<IPage>("Page");
        await page.FillAsync("input[name='email']", email);
    }

    [When(@"I fill in the username field with (.*)")]
    public async Task WhenIFillInTheUsernameFieldWith(string firstName)
    {
        var page = _scenarioContext.Get<IPage>("Page");
        await page.FillAsync("input[name='firstName']", firstName);
    }

    [When(@"I fill in the password field with (.*)")]
    public async Task WhenIFillInThePasswordFieldWith(string password)
    {
        var page = _scenarioContext.Get<IPage>("Page");
        await page.FillAsync("input[name='password']", password);
    }

    [When(@"I select (.*) as the company")]
    public async Task WhenISelectAsTheCompany(string company)
    {
        var page = _scenarioContext.Get<IPage>("Page");

        await page.SelectOptionAsync("select[name='company']", new SelectOptionValue { Value = company });
    }

    [When(@"I select (.*) as the role")]
    public async Task WhenISelectAsTheRole(string role)
    {
        var page = _scenarioContext.Get<IPage>("Page");

        await page.SelectOptionAsync("select[name='role']", new SelectOptionValue { Value = role });
    }

    [When("I submit the create user form")]
    public async Task WhenISubmitTheCreateUserForm()
    {
        var page = _scenarioContext.Get<IPage>("Page");
        await page.ClickAsync("button[type='submit']");
    }

    [Then("I should see a success message")]
    public async Task ThenIShouldSeeASuccessMessage()
    {
        var page = _scenarioContext.Get<IPage>("Page");
        var successMessage = page.Locator("text=Användare skapades framgångsrikt!");
        await successMessage.WaitForAsync(new() { State = WaitForSelectorState.Visible, Timeout = 10000 });
        Assert.True(await successMessage.IsVisibleAsync());
    }

    [Then("the form should be reset")]
    public async Task ThenTheFormShouldBeReset()
    {
        var page = _scenarioContext.Get<IPage>("Page");
        var emailField = await page.InputValueAsync("input[name='email']");
        Assert.True(string.IsNullOrEmpty(emailField));
    }
}