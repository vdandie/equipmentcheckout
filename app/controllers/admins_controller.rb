class AdminsController < ApplicationController 
  before_action :logged_in_admin, only: 
  [:new, :create, :show, :index, :edit, :update, :destroy]
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "Admin Successfully Created!"
      redirect_to equipment_index_path
    else
      render 'new'
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def destroy
    Admin.find(params[:id]).destroy
  end

  def index
    @admins = Admin.all
  end

  private 

    def admin_params
      params.fetch(:admin, {}).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_admin
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end