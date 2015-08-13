require 'test_helper'

class AdminTest < ActiveSupport::TestCase
	def setup 
		@admin = Admin.create(name: "Daniel Swain", email: "danieswain@gmail.com")
	end

	test "should be valid" do 
		assert @admin.valid?
	end

	test "name should be present" do 
		@admin.name = "   "
		assert_not @admin.valid?
	end

	test "name should not be too long" do 
		@admin.name = "a" * 100
		assert_not @admin.valid?
	end

	test "name should reject invalid names" do
		invalid_names = {"@!$%,.", "\./ ^&*()", "=+_ ~`'" }
		invalid_names.each do |invalid_name|
			@admin.name = invalid_name
			assert_not @admin.name, "#{invalid_name} should not be accepted."
		end
	end

	test "name should accept valid names" do
		valid_names = {"Ruger Payne", "Darick Falwell", "Dougas Woods", "Bracks-Lurs Santagar"}
		valid_names.each do |valid_name|
			@admin.name = valid_name
			assert @admin.name, "#{valid_name} should be accepted."
		end
	end

	test "email should be present" do
		@admin.email = "   "
		assert_not @email.valid?
	end

	test "email should not be too long" do
		@admin.email = "a" * 100
		assert_not @email.valid?
	end

	test "email should reject invalid emails" do
		invalid_emails = %w[foobar.at.foo.com foobat@foocom foo%com]
		invalid_emails.each do |invalid_email|
			@admin.email = invalid_email
			assert_not @admin.email, "#{invalid_email} should not be accepted."
		end
	end
end
