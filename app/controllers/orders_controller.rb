class OrdersController < ApplicationController
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
    redirect_to soaps_path, notice: "The soap was added to your cart!"
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:date)
  end
end


