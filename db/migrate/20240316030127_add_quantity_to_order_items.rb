class AddQuantityToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :qunatity, :integer
  end
end
