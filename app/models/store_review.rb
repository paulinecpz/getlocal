class StoreReview < ApplicationRecord
  belongs_to :store
  belongs_to :user

  validates :content, presence: true
  validates :stars, presence: true
end
