class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review).where(user: current_user)
  end

  def show
  end

  def new
    @review = Review.new
    @order = Order.find(order_params)
    @review.order = @order
  end

  def create
  end

  private

  def order_params
    params.require(:order).permit(:state, :user_id, :amount)
  end
end
