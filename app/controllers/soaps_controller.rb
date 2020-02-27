class SoapsController < ApplicationController
  def index
    @soaps = Soap.all
  end

  def show
    @soap = Soap.find(params[:id])
    @user = @soap.user
  end

  def new
    @soap = Soap.new
  end

  def create
    @soap = Soap.new(soap_params)
    @user = @soap.user
    if @soap.save!
      redirect_to soap_path(@soap)
    else
      render :new
    end
  end

  private

  def soap_params
    params.require(:soap).permit(:name, :scent, :properties, :price, :weight, :user_id, :photo)
  end
end
