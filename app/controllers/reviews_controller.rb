class ReviewsController < ApplicationController
  def index
    @review = Review.where(review_params)
  end

  def new
    @order = Order.find(params[:order_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)

    @order = Order.find(params[:order_id])
    @review.order_id = @order.id
    authorize @review
    if @review.save
      redirect_to order_path(@store)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
