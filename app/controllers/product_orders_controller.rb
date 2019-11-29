class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: [:show, :edit, :update, :destroy]


  def index
    @product_orders = policy_scope(ProductOrders)
  end

  def show
  end

  def new
  end

  def create
    @store = Store.find(params[:store_id])
    @order = Order.where(user: current_user).first_or_create
    @order.user = current_user
    @order.save!
    @product_order = ProductOrder.new
    @product_order.order = @order
    @product = Product.find(params[:product_id])
    @product_order.product = @product
    authorize @product_order
    @product_order.save
    redirect_to store_path(@store)
  end

  private

  def set_product_order
    @product_order = ProductOrder.find(params[:id])
    authorize @product_order
  end

  def product_order_params
    params.require(:product_order).permit(:quantity, :product_id, :order_id)
  end
end
