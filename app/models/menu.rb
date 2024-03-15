class Menu < ApplicationRecord
  has_many :order_item
  has_many :item, through: :order_item
end
