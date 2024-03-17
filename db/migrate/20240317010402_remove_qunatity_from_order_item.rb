class RemoveQunatityFromOrderItem < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :qunatity, :integer
  end
end
