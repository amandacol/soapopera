class SoapsController < ApplicationController
  before_action :set_soap, only: [:show]

  def index
    @soaps = Soap.all
  end

<<<<<<< HEAD
  def show
    @soap = Soap.find(params[:id])
    @user = @soap.user
  end

=======
>>>>>>> 07a78058b277b3e23da014ba55d0caf4d5856ac7
  def new
    @soap = Soap.new
  end

  def create
    @soap = Soap.new(soap_params)
    @soap.user = current_user
    if @soap.save!
      redirect_to soap_path(@soap)
    else
      render :new
    end
  end

  def show
  end

  private

  def set_soap
    @soap = Soap.find(params[:id])
  end

  def soap_params
    params.require(:soap).permit(:name, :scent, :properties, :price, :weight, :user_id, :photo)
  end
end
