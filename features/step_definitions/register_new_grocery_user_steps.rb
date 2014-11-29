Given(/^I navigate to the tesco grocery site$/) do
  website.home.load
  website.home.displayed?
  #website.home.navigate_to("Groceries")
  website.first_registration_page.load
end

Given(/^I register as a new grocery user with postcode "(.*?)"$/) do |postcode|
  website.first_registration_page.displayed?
  website.first_registration_page.add_random_user(postcode)
end
Given(/^I apply for a new clubcard successfully$/) do
  website.clubcard_registration_page.complete_clubcard_form
  website.clubcard_registration_page.confirm_successful_registration
end

Then(/^I am directed to tesco main uk site$/) do
  website.home.displayed?
end
