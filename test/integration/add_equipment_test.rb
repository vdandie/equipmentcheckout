require 'test_helper'

class AddEquipmentTest < ActionDispatch::IntegrationTest

	test "invalid equipment add information" do 
		log_in_as(@admin)
		get addequipment_path
		assert_no_difference 'Equipment.count' do
			post equipment_index_path, equipment:{ name: "",
											 tag: "aaa.[,",
											 status: nil }
		end
		assert_template 'equipment/new'
	end

	test "valid equipment add information" do
		log_in_as(@admin, {})
		get addequipment_path
		assert_difference 'Equipment.count', 1 do
			post_via_redirect equipment_index_path, 
			equipment: { name: "macbook",
						tag: "z9",
						status: true}
		end
		assert_template 'equipment/show'
	end
end
