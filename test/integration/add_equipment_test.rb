require 'test_helper'

class AddEquipmentTest < ActionDispatch::IntegrationTest

	test "invalid equipment add information" do 
		get addequipment_path
		assert_no_difference 'Equipment.count' do
			post equipment_path, equipment:{ id: "",
											 name: "",
											 tag: "aaa",
											 status: nil }
		end
		assert_template 'equipment/new'
	end
end
