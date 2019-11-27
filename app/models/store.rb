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


  def is_owner?(user)
    self.user == user
  end
end
