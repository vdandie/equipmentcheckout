require 'test_helper'

class AdminsLoginTest < ActionDispatch::IntegrationTest
	def setup
		@admin = admins(:daniel)
	end
  
	test "login with invalid information" do 
		get login_path
		assert_template 'sessions/new'
		post login_path, session: { email: "", password: "" }
		assert_template 'sessions/new'
		assert_not flash.empty?
		get root_path
		assert flash.empty?
	end

	test "login with valid information" do
		get login_path
		post login_path, session: { email: @admin.email, password: 'password'}
		assert is_logged_in?
		assert_redirected_to equipment_index_path
		follow_redirect!
		assert_template 'equipment/index'
		assert_select "a[href=?]", login_path, count: 0
		assert_select "a[href=?]", logout_path
		assert_select "a[href=?]", equipment_index_path
		delete logout_path
		assert_not is_logged_in?
		assert_redirected_to root_url
		follow_redirect!
		assert_select "a[href=?]", login_path
		assert_select "a[href=?]", logout_path,	count: 0
		assert_select "a[href=?]", equipment_index_path, count: 0
	end
end
