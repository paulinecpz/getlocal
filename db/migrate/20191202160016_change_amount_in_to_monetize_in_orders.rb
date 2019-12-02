class ChangeAmountInToMonetizeInOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :amount, :monetize

  end
end
