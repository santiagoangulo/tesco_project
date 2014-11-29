Feature: Add first n elements of a search to the shopping list
        So that I can order groceries online

    Background:
    	Given I authenticate as a grocery user with user "santi.tesco.test@gmail.com" and password "T3$co_Password"

	Scenario: Authenticated user searches for apples and adds 5 top results to shopping basket
		Given I search for "Apples"
		And I add the top "5" results to my shopping 
		Then I can see those "Apples" added to my shoping bag