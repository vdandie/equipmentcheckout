require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  def setup
    @admin = admins(:daniel)
    @equipment = equipment(:tablet)
  end

  test "should get new" do
    log_in_as(@admin)
    get :new
    assert_response :success
  end

  test "should redirect new when not logged in" do 
    get :new
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should get index" do
    log_in_as(@admin)
    get :index
    assert_response :success
  end

  test "should redirect index when not logged in" do 
    get :index
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should get edit" do
    log_in_as(@admin)
    get :edit, :id => @equipment.id
    assert_response :success
  end

  test "should redirect edit when not logged in" do 
    get :edit, :id => @equipment.id
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @equipment, equipment: { tag: @equipment.tag, name: @equipment.name, status: @equipment.status}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should get create" do
    log_in_as(@admin)
    get :create
    assert_response :success
  end

  test "should redirect create when not logged in" do 
    get :create
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should get show" do
    log_in_as(@admin)
    get :show, :id => @equipment.id
    assert_response :success
  end

  test "should redirect show when not logged in" do 
    get :show, :id => @equipment.id
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end
