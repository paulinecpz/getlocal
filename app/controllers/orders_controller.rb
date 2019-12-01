class OrdersController < ApplicationController
  before_action :set_order, only: [:destroy, :show, :create, :new]

  def index
    @orders = policy_scope(Order).where(user: current_user)
  end

  def show
    @product_orders = ProductOrder.joins(:orders).where(:orders => {:user_id => current_user.id})
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: 'Order was successfully destroyed'
  end

  private

  def set_order
    @order = Order.where(user: current_user)
    @product_orders = ProductOrder.where(product_order_params)
    authorize @order
    authorize @product_orders
  end

  def order_params
    params.require(:order).permit(:amount, :amount, :state)
  end

  def product_order_params
    params.require(:product_order).permit(:quantity, :product_id, :order_id)
  end
end
