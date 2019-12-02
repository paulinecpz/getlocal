class AddUserToProductOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_orders, :user, foreign_key: true
  end
end
