class SoapsController < ApplicationController
  before_action :set_soap, only: [:show, :edit, :update, :destroy]

  def index
    @soaps = Soap.all
    @soaps = policy_scope(Soap).order(created_at: :desc)
    @markers = @soaps.map do |soap|
      {
        lat: soap.latitude,
        lng: soap.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { soap: soap })
      }
    end
  end

  def show
    @order = Order.new
    @user = @soap.user
  end

  def edit
  end

  def update
    if @soap.update(soap_params)
      redirect_to soap_path(@soap)
    else
      render :edit
  end
  end

  def new
    @soap = Soap.new
    authorize @soap
  end

  def create
    @soap = Soap.new(soap_params)
    authorize @soap
    @soap.user = current_user
    @soap.latitude = current_user.latitude
    @soap.longitude = current_user.longitude

    if @soap.save!
      redirect_to soap_path(@soap)
    else
      render :new
    end

  end

  def destroy
    @soap.destroy
    redirect_to soaps_path
  end

  private

  def set_soap
    @soap = Soap.find(params[:id])
    authorize @soap
  end

  def soap_params
    params.require(:soap).permit(:name, :scent, :properties, :price, :weight, :user_id, :photo)
  end
end
