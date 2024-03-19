class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :menus, through: :order_items

  # def clear
  #   order_items.destroy_all
  # end
end
