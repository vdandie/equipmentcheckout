class SessionsController < ApplicationController
  def new
  end

  def create
  	admin = Admin.find_by(email: params[:session][:email].downcase)
  	if admin && admin.authenticate(params[:session][:password])
  		log_in admin
  		redirect_to admin
  	else
  		flash.now[:danger] = 'Invalid email or password. Try again.'
  		render 'new'
  	end
  end

  def destroy
  end
end
