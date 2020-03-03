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
    redirect_to soaps_path, notice: "Successfully added to cart!"
  end

  def destroy
    @order.destroy
    authorize @order
    redirect_to soaps_path
  end

  def deliver
    orders = current_user.orders.where(delivered: false)
    authorize orders
    orders.each do |order|
      order.delivered = true #metodo usado para "pular" a validacao do belongs_to
      order.save(validate: false)
    end
    redirect_to soaps_path, notice: "Thank's for your purchase..!"
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:date)
  end
end


