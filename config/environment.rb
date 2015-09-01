# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '587',
  :authentication => :plain,
  :user_name => ENV['app40347557@heroku.com'],
  :password => ENV['xp0wir5c9996'],
  :domain => 'heroku.com',
  :enable_startstls_auto => true
}
