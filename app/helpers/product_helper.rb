module ProductHelper
  def total_price(product_order)
    product = product_order.product
    product.discount = 0 if product.discount.blank?
    ((product.price - (product.price * product.discount)) * product_order.quantity).round(2)
  end
end
