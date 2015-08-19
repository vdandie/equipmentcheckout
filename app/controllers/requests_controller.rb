class RequestsController < ApplicationController
  before_action :logged_in_admin, only:
  [:index, :destroy]

  def new
    @request = Request.new
  end

  def create
    @equipment = Equipment.find_by(equipment_params)
    @request = @equipment.requests.build(request_params)
    if @request.save
      flash[:success] = "Request Successfully Made!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @requests = Request.paginate(page: params[:page])
  end

  def destroy
    @request = Request.find(params[:id])
    @equipment = @request.equipment
    @equipment.update_attribute :status, true
    @equipment.save
    @request.destroy
    flash[:success] = "Request deleted."
    redirect_to requests_path
  end

    private

    def equipment_params
      params.fetch(:equipment, {}).permit(:tag, :name, :status)
    end

    def request_params
      params.fetch(:request, {}).permit(:name, :email, :sid)
    end

    def logged_in_admin
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
