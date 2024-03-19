class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.belongs_to :menu
      t.belongs_to :order
      t.integer :total

      t.timestamps
    end
  end
end
