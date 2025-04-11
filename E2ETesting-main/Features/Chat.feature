Feature: Realtime Chat Communication

    Scenario: Customer and staff communicate in real-time
        Given the customer submits a support form with a message
        When the customer opens the chat from the email link
        Then the message should be visible in the chat
        When the staff logs in and opens the same chat
        Then the staff should see the customer's message
        When the staff responds to the message
        Then the customer should see the staff's response