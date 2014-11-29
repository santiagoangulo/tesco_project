require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'cucumber'
require 'rspec'
require 'site_prism'
require 'selenium-webdriver'
require 'active_support/dependencies'
require 'pry'
require 'io/console'
require 'require_all'

ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'lib'))

# setup config for browser
Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.run_server = false
  config.default_selector = :css
  config.ignore_hidden_elements = true
  config.visible_text_only = false
  config.match = :prefer_exact
  config.exact_options = true
end


Capybara.register_driver :selenium_chrome do |app|
  # Local
  # Capybara::Selenium::Driver.new(app,
  #                                browser: :chrome,
  #                                :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate]
  #                                )
  Capybara::Selenium::Driver.new(app,
                                 browser: :chrome
                                 )
end

After do
  page.driver.browser.quit #.execute_script "window.close();"
  Capybara.send(:session_pool).delete_if { |key, value| key =~ /selenium/i }
end

#Lengthen timeout in Net::HTTP

module Net
  class HTTP
    alias :old_initialize initialize
    def initialize(*args)
      old_initialize(*args)
      @read_timeout = 5*60 #5minutes
    end
  end
end

#headless stuff
if ENV['E2EHEADLESS'] == 'true'
  require 'headless'
  display = 100 + Random.rand(900)
  headless = Headless.new(display: display, destroy_at_exit: true)
  headless.start
end

World(Capybara)