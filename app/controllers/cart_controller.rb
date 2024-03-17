class CartController < ApplicationController
  before_action :find_order
  before_action :find_order_item , only: [ :create,:destroy]
def create
  @order_item=@order.order_item.find_by(menu_id: order_item_params[:menu_id])
  if @order_item
    if
      @order_item.update(quantity: @order_item.quantity+1)
      redirect_to order_item_path, notice: "item qunatity updated successfully"
    else
      redirect_to order_item_path, notice: "item quantity was not updated"
    end
  else
    @order_item = @order.order_item.build(order_item_params.merge(quantity: 1))
    if @order_item.save
      redirect_to order_item_path, notice: "Item added to cart successfully"
    else
      redirect_to order_item_path, alert: "Item could not be added"
    end
  end

end
def decrement
  @order_item=@order.order_item.find_by(params[:id])
  if @order_item.quantity>1
    if
      @order_item.update(quantity: @order_item.quantity-1)
      redirect_to order_item_path, notice: "quantity reduced successfully"
    else
      redirect_to order_item_path, notice: "could not update"
    end
  else
    @order_item.destroy
    redirect_to order_item_path, alert: "item deleted"
  end
end
private

  def find_order
    @order = current_user.order.last
    @order ||= current_user.order.create
  end

  def find_order_item

  end

  def order_item_params
    params.require(:order_item).permit(:menu_id)
  end
end
