require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  
  def setup
  	@equipment = equipment(:tablet)
  	@request = @equipment.requests.build(name: 	"Badger Lord", 
  										email: 	"l0rDbaddy@badger.com", 
  										sid: 	"907666666")
  end
  
  test "should be valid" do
  	assert @request.valid?
  end

  #~Name Tests~#
	test "name should be present" do 
		@request.name = "   "
		assert_not @request.valid?
	end

	test "name should not be too long" do 
		@request.name = "a" * 101
		assert_not @request.valid?
	end

	test "name validation should reject invalid names" do
		invalid_names = [ "@!$%,.1", "./ ^&*()", "=+_ ~`'" ]
		invalid_names.each do |invalid_name|
			@request.name = invalid_name
			assert_not @request.valid?, "#{invalid_name} should not be accepted."
		end
	end

	test "name validation should accept valid names" do
		valid_names = [ "Ruger Payne", "Darick Falwell", "Dougas Woods", "Bracks-Lurs Santagar" ]
		valid_names.each do |valid_name|
			@request.name = valid_name
			assert @request.valid?, "#{valid_name} should be accepted."
		end
	end

	#~Email Tests~#
	test "email should be present" do
		@request.email = "   "
		assert_not @request.valid?
	end

	test "email should not be too long" do
		@request.email = "a" * 101
		assert_not @request.valid?
	end

	test "email validation should reject invalid emails" do
		invalid_emails = %w[foobar.at.foo.com foobat@foocom foo%com]
		invalid_emails.each do |invalid_email|
			@request.email = invalid_email
			assert_not @request.valid?, "#{invalid_email} should not be accepted."
		end
	end

	#~SID Tests~#
	test "SID should be present" do
		@request.sid = " "
		assert_not @request.valid?
	end

	test "SID should not be too long" do
		@request.sid = "0" * 10
		assert_not @request.valid?
	end

	test "SID should not be too short" do
		@request.sid = "0" * 8
		assert_not @request.valid?
	end

	test "SID should begin with 907" do 
		@request.sid = "000" * 3
		assert_not @request.valid?
	end

	#~Equipment Tests~#
	test "equipment id should be present" do 
		@request.equipment_id = nil
		assert_not @request.valid?
	end

	#~Other Tests~#
	test "order should be most recent first" do
 		assert_equal requests(:most_recent), Request.first
	end
end
