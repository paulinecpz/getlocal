class ReviewsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)

    @order = Order.find(params[:order_id])
    @review.order = @order
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to store_path(@store) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'store/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
