#require 'model/website/site/constants'
#require 'model/website/site/actions'

module Website
	class Site
		#include Model::Website::Site::Constants	
		#include Model::Website::Site::Actions

		attr_accessor :url

		def initialize
			@url ||= set_url 
		end

		def set_url 
			return "http://www.tesco.com"
		end

		# Provide a way to access an instance of the class
	    def self.instance
	      @instance ||= new 
	    end

	    # WORLD_MAP access from the class level
	    def self.world_map
	      if defined?(world_map)
	        @world_map ||= world_map
	      else
	        @world_map ||= OpenStruct.new
	      end
	    end

		def home
			@home ||= Website::Home.new
		end

		def first_registration_page
			@first_registration_page ||= Website::Page::FirstRegistrationPage.new
		end

		def clubcard_registration_page
			@clubcard_registration_page ||= Website::Page::ClubcardRegistrationPage.new
		end

		def registration_confirmation_page
			@registration_confirmation_page ||= Website::Page::RegistrationConfirmationPage.new
		end

		def groceries_landing_page
			@groceries_landing_page ||= Website::Page::GroceriesLandingPage.new
		end

	end
end