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
  has_many :reviews
  has_many :product_orders

  has_many :products, through: :product_orders
  mount_uploader :photo, PhotoUploader

end
