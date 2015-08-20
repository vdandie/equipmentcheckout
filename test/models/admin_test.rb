require 'test_helper'

class AdminTest < ActiveSupport::TestCase
	def setup 
		@admin = Admin.create(name: "Daniel Swain",
							 email: "danieswain@gmail.com",
							 password: "foob",
							 password_confirmation: "foob")
	end

	test "should be valid" do 
		assert @admin.valid?
	end

	#~Name Tests~#
	test "name should be present" do 
		@admin.name = "   "
		assert_not @admin.valid?
	end

	test "name should not be too long" do 
		@admin.name = "a" * 101
		assert_not @admin.valid?
	end

	test "name validation should reject invalid names" do
		invalid_names = [ "@!$%,.1", "./ ^&*()", "=+_ ~`'" ]
		invalid_names.each do |invalid_name|
			@admin.name = invalid_name
			assert_not @admin.valid?, "#{invalid_name} should not be accepted."
		end
	end

	test "name validation should accept valid names" do
		valid_names = [ "Ruger Payne", "Darick Falwell", "Dougas Woods", "Bracks-Lurs Santagar" ]
		valid_names.each do |valid_name|
			@admin.name = valid_name
			assert @admin.valid?, "#{valid_name} should be accepted."
		end
	end

	#~Email Tests~#
	test "email should be present" do
		@admin.email = "   "
		assert_not @admin.valid?
	end

	test "email should not be too long" do
		@admin.email = "a" * 101
		assert_not @admin.valid?
	end

	test "email validation should reject invalid emails" do
		invalid_emails = %w[foobar.at.foo.com foobat@foocom foo%com]
		invalid_emails.each do |invalid_email|
			@admin.email = invalid_email
			assert_not @admin.valid?, "#{invalid_email} should not be accepted."
		end
	end

	test "email should be unique" do
		duplicate_admin = @admin.dup
		duplicate_admin.email = @admin.email.upcase
		@admin.save
		assert_not duplicate_admin.valid?
	end

	#~Password Tests~#
	test "password should be present" do
		@admin.password = @admin.password_confirmation = "  " * 6
		assert_not @admin.valid?
	end

	test "password should have a minimum length" do
		@admin.password = @admin.password_confirmation = "a" * 3
		assert_not @admin.valid?
	end

	test "password should have a maximum length" do
		@admin.password = @admin.password_confirmation = "a" * 17
		assert_not @admin.valid?
	end

	test "password validation should reject invalid passwords" do
		invalid_passwords = %w[1ag 1*&sjdaladF a209FFawq-]
		invalid_passwords.each do |invalid_password|
			@admin.password = @admin.password_confirmation = invalid_password
			assert_not @admin.valid?, "#{invalid_password} should not be accepted."
		end
	end

	test "password validation should accept valid passwords" do
		valid_passwords = %w[asdfg 314sf 000odf]
		valid_passwords.each do |valid_password|
			@admin.password = @admin.password_confirmation = valid_password
			assert @admin.valid?, "#{valid_password} should be accepted."
		end
	end

	#~Other Tests~#
	test "should signout request" do
		daniel = admins(:daniel)
		macbook_request = requests(:macbook)
		macbook = equipment(:laptop)
		macbook_request.equipment_id = macbook.id

		assert_not daniel.signed_out?(macbook_request)
		daniel.sign_out(macbook_request)
		assert daniel.signed_out?(macbook_request)
		assert_not macbook_request.equipment.status
		assert macbook_request.signed_out_by.include?(daniel)
		daniel.undo_sign_out(macbook_request)
		assert_not daniel.signed_out?(macbook_request)
		assert macbook_request.equipment.status
	end

	test "should signin request" do
		daniel = admins(:daniel)
		macbook_request = requests(:macbook)
		macbook = equipment(:laptop)
		macbook_request.equipment_id = macbook.id

		assert_not daniel.signed_in?(macbook_request)
		daniel.sign_in(macbook_request)
		assert daniel.signed_in?(macbook_request)
		assert macbook_request.equipment.status
		assert macbook_request.signed_in_by.include?(daniel)
		daniel.undo_sign_in(macbook_request)
		assert_not daniel.signed_in?(macbook_request)
		assert macbook_request.equipment.status
	end
end
