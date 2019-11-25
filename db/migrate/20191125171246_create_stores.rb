class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :picture
      t.string :website
      t.integer :phone
      t.float :longitude
      t.float :latitude
      t.string :state, default: "pending"
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
