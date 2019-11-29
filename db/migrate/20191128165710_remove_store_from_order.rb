class RemoveStoreFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_reference :orders, :store, foreign_key: true
  end
end
