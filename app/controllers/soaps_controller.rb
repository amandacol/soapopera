class SoapsController < ApplicationController
  before_action :set_soap, only: [:show]

  def index
    @soaps = Soap.all
    @soaps = policy_scope(Soap).order(created_at: :desc)
  end

  def show
    @soap = Soap.find(params[:id])
    authorize @soap
    @order = Order.new
    @user = @soap.user
  end

  def new
    @soap = Soap.new
    authorize @soap
  end

  def create
    @soap = Soap.new(soap_params)
    authorize @soap
    @soap.user = current_user
    if @soap.save!
      redirect_to soap_path(@soap)
    else
      render :new
    end
  end

  def destroy
    @soap = Soap.find(params[:id])
    authorize @soap
    @soap.destroy
    redirect_to soaps_path
  end

  private

  def set_soap
    @soap = Soap.find(params[:id])
  end

  def soap_params
    params.require(:soap).permit(:name, :scent, :properties, :price, :weight, :user_id, :photo)
  end
end
