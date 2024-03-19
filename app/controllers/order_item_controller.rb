class OrderItemController < ApplicationController
  before_action :find_order


  def create
    @order_item=@order.order_items.find_by(menu_id: order_item_params[:menu_id])
    if @order_item
      if @order_item.update(quantity: @order_item.quantity+1)
        redirect_to menu_path,notice: "Item Quantity updated"
      else
        redirect_to menu_path, alert: "Item Quantity could not be updated"
      end
    else
      @order_item=@order.order_items.build(order_item_params.merge(quantity: 1))
      if @order_item.save
        redirect_to menu_path, notice: "Item is added to the cart"
      else
        redirect_to menu_path, alert: "Item could not be added"
      end
    end

  end
  def decrement
    @order_item=@order.order_items.find_by(menu_id: order_item_params[:menu_id])
   if @order_item.quantity>1
     if @order_item.update(quantity: @order_item.quantity-1)
       redirect_to menu_path, notice: "quantity is reduced"
     else
      redirect_to menu_path, alert: "quantity could not be updated"

     end
    else
      @order_item.destroy
      redirect_to menu_path, alert: "Item deleted"
   end
  end
  def list
    @order_list=current_user.orders.last.order_items
    @show_nar=true
    @sum_order=calculate_sum(current_user.id)
    p @sum_order
    puts
    puts
    puts

  end

  # def destroy
  #   @order_item.destroy
  #   redirect_to menu_path, alert: "Item destroyed"
  # end

  private
  def calculate_sum(user_id)
    current_order = Order.find_by(user_id: user_id)
    if current_order
      cost = current_order.order_items.map { |item| menu_price(item.menu_id) * item.quantity }
       return cost.reduce(0, :+)

  end
end
  def find_order
    @order = current_user.orders.last
    if @order.nil?
      current_user.order.create
    end
  end

  def order_item_params
    params.require(:order_item).permit(:menu_id)
  end

  def menu_price(menu_id)
    menu_item = Menu.find_by(id: menu_id)
    menu_item ? menu_item.cost: 0
  end


end
