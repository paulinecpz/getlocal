class ChangePhoneToBeTextInStores < ActiveRecord::Migration[5.2]
  def change
  	change_column :stores, :phone, :text
  end
end
