module RequestsHelper

	def sign_out_date(request)
		@sign_out = SignOut.find_by(request_id: request.id)
		@sign_out.created_at
	end
end
