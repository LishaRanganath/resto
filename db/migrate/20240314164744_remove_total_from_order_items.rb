class RemoveTotalFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :total, :integer
  end
end
