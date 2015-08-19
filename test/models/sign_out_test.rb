require 'test_helper'

class SignOutTest < ActiveSupport::TestCase
  
  def setup
  	@signout = SignOut.new(admin_id: 1, request_id: 1)
  end

  test "should be valid" do 
  	assert @signout.valid?
  end

  test "should require an admin_id" do 
  	@signout.admin_id = nil
  	assert_not @signout.valid?
  end

  test "should require a request_id" do 
  	@signout.request_id = nil
  	assert_not @signout.valid?
  end
end
