class Store < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :days
  has_many :reviews
  has_many :product_orders, through: :products
  has_many :categories, through: :products

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  has_many :pictures, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def is_owner?(user)
    self.user == user
  end
end
