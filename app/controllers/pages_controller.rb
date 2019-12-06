class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @stores = policy_scope(Store).order(:created_at)
    @stores_near = policy_scope(Store).geocoded.near([38.736946, -9.142685],10,  :order => :distance)   
    @stores_lisbon = policy_scope(Store).where("address ILIKE ?", "%Lisbon%").limit(6)
    @stores_porto = policy_scope(Store).where("address ILIKE ?", "%Porto%").limit(6)
    @stores_paris = policy_scope(Store).where("address ILIKE ?", "%Paris%").limit(6)
    @stores_lyon = policy_scope(Store).where("address ILIKE ?", "%Lyon%").limit(6)
    @stores_london = policy_scope(Store).where("address ILIKE ?", "%london%").limit(6)
    @stores_barcelona = policy_scope(Store).where("address ILIKE ?", "%Barcelona%").limit(6)

  	store_from_vegetable_ids = Product.joins(:category).where("categories.name = ?", "Vegetables").pluck(:store_id)
    @stores_vegetables = @stores.where(id: store_from_vegetable_ids).where("address ILIKE ?", "%Lisbon%").limit(6)

    store_from_fruits_ids = Product.joins(:category).where("categories.name = ?", "Fruits").pluck(:store_id)
    @stores_fruits = @stores.where(id: store_from_fruits_ids).where("address ILIKE ?", "%Lisbon%").limit(6)

    @stores_best_rated = policy_scope(Store).where("address ILIKE ?", "%Lisbon%").limit(6)

    # @stores_best_rated = policy_scope(Store).where(stars: 5)
  end

  def dashboard
    current_user.first_name
    # current_user.stores
    # current_user.orders
    # current_user.reviews
  end
end

