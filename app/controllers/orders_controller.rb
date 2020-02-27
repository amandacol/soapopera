class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  def create
    @soap = Soap.find(params[:soap_id])
    @order = Order.new
    @order.soap = @soap
    @order.user = current_user
    @order.date = Time.now
    @order.save
    redirect_to root_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:date)
  end
end
