module RequestsHelper

	def sign_out_date(request)
		@sign_out = SignOut.find_by(request_id: request.id)
		t = @sign_out.created_at
		t.strftime("%m/%d/%Y @ %I:%M%p")
	end

	def sign_in_date(request)
		@sign_in = SignIn.find_by(request_id: request.id)
		t = @sign_in.created_at
		t.strftime("%m/%d/%Y @ %I:%M%p")
	end

	def get_admin_name_from_sign_out(request)
		if request.signed_out?
			@signout = SignOut.find_by(request_id: request.id)
			@name = Admin.find_by(id: @signout.admin_id).name
		end
	end

	def get_admin_name_from_sign_in(request)
		if request.signed_in?
			@signin = SignIn.find_by(request_id: request.id)
			@name = Admin.find_by(id: @signin.admin_id).name
		end
	end
end
