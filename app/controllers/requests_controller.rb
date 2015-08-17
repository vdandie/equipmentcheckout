class RequestsController < ApplicationController
  before_action :logged_in_admin, only:
  [:index, :destroy]

  def new
    @request = Request.new
  end

  def create
    @equipment = Equipment.find_by(tag: params[:equipment][:tag])
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
    Request.find(params[:id]).destroy
    flash[:success] = "Request deleted."
    redirect_to requests_path
  end

    private

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
