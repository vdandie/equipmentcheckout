module SessionsHelper
	def log_in(admin)
		session[:admin_id] = admin.id
	end

	def current_admin
		@current_admin ||= Admin.find_by(id: session[:admin_id])
	end

	def logged_in?
		!current_admin.nil?
	end

	def log_out
		session.delete(:admin_id)
		@current_admin = nil
	end

	def redirect_back_or(default)
		redirect_to(session[:fowarding_url] || default)
		session.delete(:fowarding_url)
	end

	def store_location
		session[:fowarding_url] = request.url if request.get?
	end
end
