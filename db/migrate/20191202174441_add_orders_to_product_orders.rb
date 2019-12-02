class AddOrdersToProductOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_orders, :order, foreign_key: true, optional: true
  end
end
