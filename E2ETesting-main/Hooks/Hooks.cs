using Microsoft.Playwright;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace E2ETesting.Hooks
{
    [Binding]
    public class Hooks
    {
        private readonly ScenarioContext _scenarioContext;
        private IPlaywright _playwright;
        private IBrowser _browser;
        private IPage _page;

        public Hooks(ScenarioContext scenarioContext)
        {
            _scenarioContext = scenarioContext;
        }

        [BeforeScenario]
        public async Task BeforeScenario()
        {
            _playwright = await Playwright.CreateAsync();

            _browser = await _playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions
            {
                Headless = true,
                SlowMo = 500,
            });

            var context = await _browser.NewContextAsync();
            _page = await context.NewPageAsync();

            _scenarioContext["Page"] = _page;
            _scenarioContext["Browser"] = _browser;
            _scenarioContext["Context"] = context;
        }

        [AfterScenario]
        public async Task AfterScenario()
        {
            // Close the browser
            await _browser.CloseAsync();
            
            // Dispose Playwright
            _playwright.Dispose();
        }
    }
}