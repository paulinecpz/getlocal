class Product < ApplicationRecord
  monetize :price_cents

  belongs_to :store
  belongs_to :category
  has_many :product_orders

  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
end
