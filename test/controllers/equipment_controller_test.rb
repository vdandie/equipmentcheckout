require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  def setup 
    @equipment = Equipment.create(tag:    'q0',
                                  name:    "laptop", 
                                  status:   true)
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
    get :edit, :id => @equipment.id
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @equipment.id
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @equipment.id
    assert_response :success
  end

end
