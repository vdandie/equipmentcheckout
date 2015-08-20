class SignInsController < ApplicationController
	before_action :logged_in_admin

	def create
		@request = Request.find(params[:request_id])
		current_admin.sign_in(@request)
		respond_to do |format|
			format.html {redirect_to :back}
			format.js
		end
	end

	def destroy
		@signin = SignIn.find(params[:id])
		@request = @signin.request
		@admin = @signin.admin
		@admin.undo_sign_in(@request)
		respond_to do |format|
			format.html {redirect_to requests_path}
			format.js
		end
	end

	private
		def logged_in_admin
	      unless logged_in?
	        store_location
	        flash[:danger] = "Please log in."
	        redirect_to login_url
	      end
	    end
end
