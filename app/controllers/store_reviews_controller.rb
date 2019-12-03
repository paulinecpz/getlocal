class StoreReviewsController < ApplicationController
  before_action :set_store

  def new
    @store_review = StoreReview.new
    authorize @store_review
  end

  def create
    @store_review = StoreReview.new(store_review_params)
    @store_review.store = @store
    @store_review.user = current_user

    authorize @store_review
    if @store_review.save
      respond_to do |format|
        format.html { redirect_to store_path(@store) }
        format.js  # <-- will render `app/views/store_reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'store/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def store_review_params
    params.require(:store_review).permit(:content, :stars)
  end

  def set_store
    @store = Store.find(params[:store_id])
    authorize @store
  end
end
