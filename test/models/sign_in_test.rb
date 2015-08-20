require 'test_helper'

class SignInTest < ActiveSupport::TestCase
  def setup
  	@signin = SignIn.new(admin_id: 1, request_id: 1)
  end

  test "sign in should be valid" do 
  	assert @signin.valid?
  end

  test "sign in should require an admin_id" do 
  	@signin.admin_id = nil
  	assert_not @signin.valid?
  end

  test "sign in should require a request_id" do 
  	@signin.request_id = nil
  	assert_not @signin.valid?
  end
end
