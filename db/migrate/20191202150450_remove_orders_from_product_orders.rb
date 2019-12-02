class RemoveOrdersFromProductOrders < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :product_orders, :orders
    remove_column :product_orders, :order_id
  end
end
