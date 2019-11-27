class Store < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :days
  has_many :reviews
  has_many :orders, through: :products, through: :product_orders
  has_many :categories, through: :products

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  has_many :pictures, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
