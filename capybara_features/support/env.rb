# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

ENV['RAILS_ENV'] = 'cucumber'
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + '/../..'))

SELENIUM_CFG = YAML::load_file(File.expand_path(File.dirname(__FILE__) + '/../../config/selenium.yml'))

require 'cucumber/rails'
require 'cucumber/rspec/doubles'
require 'spec/support/uploadable_files'
require 'spec/support/child_finder'
require 'json_spec/cucumber'
require 'rack/test'
require 'selenium/webdriver'
require 'sunspot_test/cucumber'

if ENV["COVERAGE"] == 'true'
  require 'simplecov'
  require 'simplecov-rcov'
  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  SimpleCov.start 'rails'
  SimpleCov.coverage_dir 'coverage/cucumber'
end

puts Rails.env

# Now that the filters use ||, we need this.  See
# http://stackoverflow.com/questions/3748838/how-to-prevent-pipe-character-from-causing-a-bad-uri-error-in-rails-3-ruby-1-9-2
URI.send(:remove_const, :DEFAULT_PARSER)
URI::DEFAULT_PARSER =
  URI::Parser.new(:UNRESERVED => URI::REGEXP::PATTERN::UNRESERVED + '|')

Capybara.register_driver :selenium do |app|
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  http_client.timeout = 100

  if ENV["SELENIUM"] == 'remote'
    Capybara::Selenium::Driver.new(app, 
      :browser => :remote, 
      :url => SELENIUM_CFG['host'],
      :desired_capabilities => SELENIUM_CFG['capabilities']
    )   
  else
    Capybara::Selenium::Driver.new(app, :browser => SELENIUM_CFG['browser'], :http_client => http_client)
  end
end

Capybara.configure do |config|
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
end

Capybara.app_host = SELENIUM_CFG['app_host'] if ENV["SELENIUM"] == 'remote'
Capybara.run_server = true #Whether start server when testing
Capybara.server_port = ENV["CAPYBARA_SERVER_PORT"] || nil
Capybara.default_selector = :xpath #default selector , you can change to :css
Capybara.default_wait_time = 25 #When we testing AJAX, we can set a default wait time
Capybara.ignore_hidden_elements = false #Ignore hidden elements when testing, make helpful when you hide or show elements using javascript
Capybara.javascript_driver = :selenium #default driver when you using @javascript tag

ActionController::Base.allow_rescue = true

module UrlHelpers
  include Rails.application.routes.url_helpers
end

World(UrlHelpers)
World(UploadableFiles, ChildFinder)

def current_databases
  COUCHDB_SERVER.databases.select do |db| 
    db if db =~ /^#{COUCHDB_CONFIG[:db_prefix]}/ and db =~ /#{COUCHDB_CONFIG[:db_suffix]}$/
  end
end

def cleanup_databases
  current_databases.each do |db|
    COUCHDB_SERVER.database(db).delete! rescue nil
  end
end

#Call method to remove databases.
cleanup_databases
