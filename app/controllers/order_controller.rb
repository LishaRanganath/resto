class OrderController < ApplicationController
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id)
  end
end
