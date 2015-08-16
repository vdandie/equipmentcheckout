require 'test_helper'

class EquipmentEditTest < ActionDispatch::IntegrationTest
  def setup
  	@admin = admins(:daniel)
  	@equipment = equipment(:tablet)
  end

  test "unsuccessful edit" do
  	log_in_as(@admin)
  	get edit_equipment_path(@equipment)
  	assert_template 'equipment/edit'
  	patch equipment_path(@equipment), equipment: { 	tag: "aaa",
  													name: "",
  													status: nil }
 	assert_template 'equipment/edit'
  end

  test "successful edit" do
  	log_in_as(@admin)
  	get edit_equipment_path(@equipment)
  	assert_template 'equipment/edit'
  	tag		=	"x7"
  	name	=	"laptop"
  	patch equipment_path(@equipment), equipment: { 	tag: tag,
  													name: name,
  													status: true }
  	assert_not flash.empty?
  	assert_redirected_to @equipment
  	@equipment.reload
  	assert_equal tag, @equipment.tag
  	assert_equal name, @equipment.name
  end

  test "successful edit with friendly fowarding" do
  	get edit_equipment_path(@equipment)
  	log_in_as(@admin)
  	assert_redirected_to edit_equipment_path(@equipment)
  	tag		=	"x7"
  	name	=	"laptop"
  	patch equipment_path(@equipment), equipment: { 	tag: tag,
  													name: name,
  													status: true }
  	assert_not flash.empty?
  	assert_redirected_to @equipment
  	@equipment.reload
  	assert_equal tag, @equipment.tag
  	assert_equal name, @equipment.name
  end
end
