module EquipmentHelper
	# Takes the status of the equipment and tells whether it's in or out.
	def give_status(status)
		if status == 2
			"IN"
		else
			"OUT"
		end
	end

end
