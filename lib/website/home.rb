class Website::Home < Website::Base
  set_url "#{Website::Site.instance.url}"
  set_url_matcher (/\//)

  element  :login_link, "#logins"
  elements :login_link_sections, ".loginPageLink ul li"
  
  def navigate_to(section)
  	binding.pry
  	login_link.click
  	binding.pry
  	login_link_sections.each do |current_section|
  		if section == current_section.text.chomp
  			current_section.click
  		end
  	end
  end

end
