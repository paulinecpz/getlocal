class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @stores = policy_scope(Store).order(:name)
    @stores_lisbon = policy_scope(Store).where("address ILIKE ?", "%Lisboa")
  	store_from_vegetable_ids = Product.where(category_id: 6).pluck(:store_id)
    @stores_vegetables = @stores.where(id: store_from_vegetable_ids)
    @stores_best_rated = policy_scope(Store).where("address ILIKE ?", "Lisbon")
  end

  def dashboard
    current_user.first_name
    # current_user.stores
    # current_user.orders
    # current_user.reviews
  end
end
