class Website::Page::ClubcardRegistrationPage < Website::Base
	
	# https://secure.tesco.com/register/default.aspx?from=http%3a%2f%2fwww.tesco.com%2fgroceries%2f
	# https://secure.tesco.com/register/
	set_url "#{Website::Site.instance.url}/register"
	set_url_matcher /register/


	# Elements found in name registration
	elements :name_title, "#title option"
	element :first_name, "#firstName"
	element :initials, "#initials"
	element :last_name, "#lastName"
	
	# Elements found in contact details
	elements :address_drop_down, "#address option"
	element :address_nickname, "#nickname"
	element :daytime_phone, "#dayPhone"
	element :evening_phone, "#eveningPhone"

	# Test
	element :password, "#password"
	element :confirm_password, "#confirmPass"

	# More about you section and T&C's
	elements :how_did_you_hear_about_us, "#howhear option"
	elements :confirmation_buttons, "div#smallPrint div p input"

	# Successful registration process and continue button
	element :thankyou_for_registering, "h2.title-main"
	element :continue_button, "p.confirm input"


	def initialize
		@password = "T3$co_Password"
		@user_mail = "santi.tesco.test@gmail.com"
	end

	# End of element section

	def complete_clubcard_form
		# binding.pry
		sleep(0.1)
		complete_name_details
		complete_address_and_phone_details
		complete_security_and_tcs
		# Submit form		
		confirmation_buttons[0].click
	end

	def confirm_successful_registration
		expect(thankyou_for_registering.text =~ /Thank you for registering/).not_to be_nil
		continue_button.click
	end

	private
	def complete_name_details
		name_title[1].click # Selecting first option "Mr". 
		first_name.set "Nametest"
		initials.set "NL"
		last_name.set "Lastnametest"
		address_drop_down[1].click # Selecting first option.
	end

	def complete_address_and_phone_details
		address_nickname.set "Tesco Test"
		daytime_phone.set "03456778996" # Ealing Store Tel no :-p
		evening_phone.set "03456778996"
	end

	def complete_security_and_tcs
		# Set Password
		password.set @password
		confirm_password.set @password
		# Confirm
		how_did_you_hear_about_us[10].click # Other		
	end

end 
