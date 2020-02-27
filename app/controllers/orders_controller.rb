class OrdersController < ApplicationController
   before_action :set_order, only: [:destroy]
  def new
    @order = Order.new
    authorize @order
  end
  def create
    @soap = Soap.find(params[:soap_id])
    @order = Order.new
    authorize @order
    @order.soap = @soap
    @order.user = current_user
    @order.date = Time.now
    @order.save
    redirect_to soaps_path
  end

  def destroy
    @order.destroy
    redirect_to soaps_path, notice: 'Are you sure about it?'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:date)
  end
end


