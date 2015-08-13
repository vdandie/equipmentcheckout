require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  def setup
    @admin = Admin.create(name:  "Daniel Swain",
                          email:  "danieswain@gmail.com",
                          password:         "foobar",
                          password_confirmation:  "foobar")
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin.id
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @admin.id
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @admin.id
    assert_response :success
  end

end
