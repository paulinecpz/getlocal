class ChangePhoneToBeStringInStores < ActiveRecord::Migration[5.2]
  def change
    change_column :stores, :phone, :string
  end
end
