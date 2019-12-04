class Order < ApplicationRecord
  monetize :amount_cents
  belongs_to :user
  has_many :product_orders
  has_many :products, through: :product_orders
  has_many :stores, through: :products
  has_one :review


end
