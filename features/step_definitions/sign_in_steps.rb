Given(/^I authenticate as a grocery user with user "(.*?)" and password "(.*?)"$/) do |mail, password|
  website.first_registration_page.load
  website.first_registration_page.displayed?
  website.first_registration_page.sign_in(mail,password)
  website.groceries_landing_page.load
end


