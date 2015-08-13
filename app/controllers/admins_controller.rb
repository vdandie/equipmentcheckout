class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
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
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
end
