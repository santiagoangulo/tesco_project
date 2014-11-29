Feature: Register a random test user
        So that I can order groceries online
        

    Scenario: Register a new random test user
        Given I navigate to the tesco grocery site
        And I register as a new grocery user with postcode "EN8 9SL"
        And I apply for a new clubcard successfully
		Then I am directed to tesco main uk site

