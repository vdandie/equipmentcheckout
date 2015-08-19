class SignOutsController < ApplicationController
	before_action :logged_in_admin

	def create
		@request = Request.find(params[:request_id])
		current_admin.sign_out(@request)
		respond_to do |format|
			format.html {redirect_to :back}
			format.js
		end
	end

	def destroy
		@request = SignOut.find(params[:id]).request
		current_admin.undo_sign_out(@request)
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
