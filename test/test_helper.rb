ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
  	!session[:admin_id].nil?
  end

  def log_in_as(admin, options = {})
  	email		= 'daniel@example.com'	|| options[:email]
  	password	= options[:password]	|| 'password'
  	if integration_test?
  		post login_path, session: { email: 		email,
                                  	password: 	password}
  	else
  		session[:admin_id] = admin.id
  	end
  end

  private

  	def integration_test?
  		defined?(post_via_redirect)
  	end
end
