class AddUserToStoreReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :store_reviews, :user, foreign_key: true
  end
end
