require 'test_helper'

class AdminSignupTest < ActionDispatch::IntegrationTest
	def setup
		@admin = admins(:daniel)
	end

	test "invalid admin sign up information" do 
		get signup_path
		assert_no_difference 'Admin.count' do
			post admins_path, admin: { 	name: 	"",
										email: 	"admin@invalid",
										password: 				"foo",
										password_confirmation: 	"bar" }
		end
		assert_template 'admins/new'
	end

	test "valid admin sign up information" do
		get signup_path
		assert_difference 'Admin.count', 1 do
			post_via_redirect admins_path, admin: { name: 	"Daniel Swain",
													email: 	"danieswain@gmail.com",
													password: 				"foobar",
													password_confirmation: 	"foobar" }
		end
		assert_template 'admins/show'
		assert is_logged_in?
	end
end
