module SessionsHelper
	def log_in(admin)
		sessions[:admin_id] = admin.id
	end
end
