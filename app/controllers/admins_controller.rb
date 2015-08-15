class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      log_in @admin
      flash[:success] = "Admin Successfully Created!"
      redirect_to @admin
    else
      render 'new'
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def index
    @admins = Admin.all
  end

  def destroy
  end

  def edit
  end

  private 

    def admin_params
      params.fetch(:admin, {}).permit(:name, :email, :password, :password_confirmation)
    end
end
