Feature: Support Ticket Submission
As a customer
I want to be able to submit a support request

    Scenario: Customer submits a support ticket successfully
        Given I am on the support form page
        When I choose Tele/Bredband from the company dropdown
        And I enter Kevin as name
        And I enter maadridista@gmail.com as email
        And I choose Bredband as service type
        And I choose Tekniskt problem as issue type
        And I enter Jag har problem! as message
        And I submit the support form
        Then I should see the confirmation message