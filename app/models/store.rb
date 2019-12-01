class Store < ApplicationRecord
  extend Geocoder::Model::ActiveRecord
  reverse_geocoded_by :latitude, :longitude

  # scope :with_distance_to, ->(point) { select("#{stores}.*").select("(#{distance_from_sql(point)}) as distance") }

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
