class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: [:show, :edit, :destroy]
  before_action :authenticate_user!

  def index
    @product_orders = policy_scope(ProductOrders)
  end

  def show
  end

  def new
  end

  def update
    @product_order = ProductOrder.find(params[:id])
    authorize @product_order

    if params[:direction] == 'up'
      @product_order.increment!(:quantity)
    else
      @product_order.decrement!(:quantity)
    end
  end

  def create
    @store = Store.find(params[:store_id])

    @product_order = ProductOrder.new
    @product = Product.find(params[:product_id])
    @product_order.product = @product
    @product_order.user = current_user

    authorize @product_order
    @product_order.save!
    
    redirect_to store_path(@store)
  end

  def destroy
    authorize @product_order
    @store = Store.find(params[:store_id])
    @product_order.destroy
    redirect_to store_path(@store), notice: 'Product was successfully deleted'
  end

  private

  def set_product_order
    @product_order = ProductOrder.find(params[:id])
    authorize @product_order
  end

  def product_order_params
    params.require(:product_order).permit(:quantity, :product_id)
  end
end
