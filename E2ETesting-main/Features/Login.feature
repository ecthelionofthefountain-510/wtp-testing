Feature: Login

    Scenario: Login in as a user
        Given I am at the WTP homepage
        And I see the navbar login button
        When I click on the navbar login button
        Then I should see the login form
        When I fill in the form with valid data
        And I click on the login form button
        Then I should be logged in