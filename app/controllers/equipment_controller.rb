class EquipmentController < ApplicationController
  before_action :logged_in_admin, only: 
  [:new, :create, :show, :index, :edit, :update, :destroy]

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      flash[:success] = "Equipment Successfully Added!"
      redirect_to @equipment
    else
      render 'new'
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def index
    @equipment = Equipment.paginate(page: params[:page])
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def update
    @equipment = Equipment.find(params[:id])
    if @equipment.update_attributes(equipment_params)
      flash[:success] = "Equipment updated"
      redirect_to @equipment
    else
      render 'edit'
    end
  end


  def destroy
    @name = Equipment.find(params[:id]).name
    Equipment.find(params[:id]).destroy
    flash[:success] = "#{@name} deleted."
    redirect_to equipment_index_path
  end

  private 

    def equipment_params
      params.fetch(:equipment, {}).permit(:tag, :name, :status)
    end

    def logged_in_admin
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end