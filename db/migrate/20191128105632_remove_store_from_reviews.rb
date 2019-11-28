class RemoveStoreFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :store, foreign_key: true
  end
end
