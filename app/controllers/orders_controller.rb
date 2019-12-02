class OrdersController < ApplicationController
  before_action :set_order, only: [:destroy, :show]
  def index
    @orders = policy_scope(Order).where(user: current_user)
    @product_orders = ProductOrder.joins(:orders).where(:orders => {:user_id => current_user.id})
    # @stores = Store.joins(:products).where(:orders => {:user_id => current_user.id})
  end

  def show
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
    @order = Order.find(params[:id])
    authorize @order
  end
end
