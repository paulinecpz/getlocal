class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order, optional: true
  validates :quantity, presence: true
  belongs_to :user

  def total_price
    ((product.price - (product.price * (product.discount || 0))) * quantity).round(2)
  end
end
