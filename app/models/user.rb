class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :stores, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :store_reviews

  # TODO CHECK IF THIS MAKES SENSE PAULINE !!!!!!!!!!!!!!!!
  has_many :product_orders
  has_many :products, through: :product_orders
  mount_uploader :photo, PhotoUploader


  def self.get_stores(user)
    return [] unless user.present?
    orders = Order.where(user_id: user.id).where(state: "paid")
    stores = []
    orders.each do |order|
      order.product_orders.each do |po|
        stores << po.product.store
      end
    end
    stores
  end

  def cart_product_orders
    product_orders.where(order: nil)
  end
end
