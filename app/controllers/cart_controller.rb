class CartController < ApplicationController
  before_action :find_order
  def create
    @order_item=@order.order_items.find_by(menu_id: order_item_params[:menu_id])
    if @order_item
      if @order_item.update(quantity: @order_item.quantity+1)
        redirect_to order_item_path,notice: "Item Quantity updated"
      else
        redirect_to  order_item_path, alert: "Item Quantity could not be updated"
      end
    else
      @order_item=@order.order_items.build(order_item_params.merge(quantity: 1))
      if @order_item.save
        redirect_to  order_item_path, notice: "Item is added to the cart"
      else
        redirect_to  order_item_path, alert: "Item could not be added"
      end
    end

  end
  def decrement
    @order_item=@order.order_items.find_by(menu_id: order_item_params[:menu_id])
   if @order_item.quantity>1
     if @order_item.update(quantity: @order_item.quantity-1)
       redirect_to  order_item_path, notice: "quantity is reduced"
     else
      redirect_to  order_item_path, alert: "quantity could not be updated"

     end
    else
      @order_item.destroy
      redirect_to  order_item_path, alert: "Item deleted"
   end
  end
def show
    @sum_order=sum_of_item(current_user.id)

end
private

def find_order
  @order = current_user.orders.last
  if @order.nil?
    current_user.order.create
  end
end


  def order_item_params
    params.require(:order_item).permit(:menu_id)
  end



end
