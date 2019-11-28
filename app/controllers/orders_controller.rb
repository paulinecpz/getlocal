class OrdersController < ApplicationController
  before_action :set_order, only: [:destroy]
  def index
    @orders = policy_scope(Order).where(user: current_user)
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
