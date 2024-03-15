class Order < ApplicationRecord
  belongs_to :user
  has_many :order_item
  has_many :item, through: :order_item
end
