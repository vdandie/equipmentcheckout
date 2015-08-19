require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  def setup
    @admin = admins(:daniel)
    @request = requests(:macbook)
  end

  test "should get new" do
    log_in_as(@admin)
    get :new
    assert_response :success
  end

  test "should get create" do
    log_in_as(@admin)
    get :create
    assert_response :success
  end
end