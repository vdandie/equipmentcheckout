module EquipmentHelper
	# Takes the status of the equipment and tells whether it's in or out.
	def give_status(status)
		if status
			"IN"
		else
			"OUT"
		end
	end

end
