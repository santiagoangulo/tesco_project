Given(/^I search for "(.*?)"$/) do |item|
  	website.groceries_landing_page.search_for(item)
end

Then(/^I add the top "(.*?)" results to my shopping$/) do |items|
	website.groceries_landing_page.empty_basket
	website.groceries_landing_page.add_first_valid_results_to_shopping_bag(items.to_i)
end

Then(/^I can see those "(.*?)" added to my shoping bag$/) do |expected_product|
	website.groceries_landing_page.items_in_basket_are(expected_product)
end

