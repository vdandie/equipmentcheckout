require 'test_helper'

class EquipmentIndexTest < ActionDispatch::IntegrationTest
  def setup
  	@admin = admins(:daniel)
  	@equipment = equipment(:tablet)
  end

#  test "index including pagination" do 
#  	log_in_as(@admin)
#  	get equipment_index_path
#  	assert_template 'equipment/index'
#  	assert_select 'div.pagination'
#  	Equipment.paginate(page: 1).each do |equipment|
#  		assert_select 'a[href=?]', equipment_path(equipment), text: equipment.name
#  	end
#  end
end
