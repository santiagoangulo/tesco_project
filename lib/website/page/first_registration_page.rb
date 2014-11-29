class Website::Page::FirstRegistrationPage < Website::Base
	
	# https://secure.tesco.com/register/default.aspx?from=http%3a%2f%2fwww.tesco.com%2fgroceries%2f
	# https://secure.tesco.com/register/
	set_url "#{Website::Site.instance.url}/register"
	set_url_matcher /register/

	#registration fields
	element :input_mail, "#regID"
	element :confirm_mail, "#confirmRegID"
	element :input_postcode, "#postcode"
	element :check_no_clubcard, "#noClubcard"
	element :registration_button, "#regButton input"
	#login fields
	element :login_id, "#loginID"
	element :password, "#password"
	element :sing_in_button, "#signinButton input"


	def add_random_user(postcode)
		time_now = Time.now.strftime "%Y%m%d%H%M"
		user_mail = time_now+"random_mail@mail.com"
		input_mail.set user_mail
		confirm_mail.set user_mail
		input_postcode.set postcode
		check_no_clubcard.click
		registration_button.click
		handle_alert	
	end

	def sign_in(user,pass)
		login_id.set user
		password.set pass
		sing_in_button.click
	end

	private
	def handle_alert
        begin
          page.driver.browser.switch_to.alert.accept
        rescue Selenium::WebDriver::Error::NoAlertPresentError
        end
    end
end