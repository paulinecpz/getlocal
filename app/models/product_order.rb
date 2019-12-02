class ProductOrder < ApplicationRecord
  belongs_to :product
  validates :quantity, presence: true

end
