require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  def setup
    @admin = admins(:daniel)
    @equipment = equipment(:tablet)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get index" do
    log_in_as(@admin)
    get :index
    assert_response :success
  end
end
