module ProductHelper
  def total_price(product_order)
    product = product_order.product

    ((product.price - (product.price * product.discount)) * product_order.quantity).round(2)
  end
end
