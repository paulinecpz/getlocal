class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @stores = policy_scope(Store).order(:created_at)
    @stores_near = policy_scope(Store).geocoded.near([38.736946, -9.142685],40000,  :order => :distance)    
    @stores_lisbon = policy_scope(Store).geocoded.near([38.736946, -9.142685],40000,  :order => :distance).where("address ILIKE ?", "%Lisbon")
    @stores_porto = policy_scope(Store).geocoded.near([38.736946, -9.142685],40000,  :order => :distance).where("address ILIKE ?", "%Porto")
    @stores_paris = policy_scope(Store).where("address ILIKE ?", "%Paris").geocoded.near([38.736946, -9.142685],40000,  :order => :distance)
    @stores_lyon = policy_scope(Store).geocoded.near([38.736946, -9.142685],40000,  :order => :distance).where("address ILIKE ?", "%Lyon")
    @stores_london = policy_scope(Store).geocoded.near([38.736946, -9.142685],40000,  :order => :distance).where("address ILIKE ?", "%london")
    @stores_barcelona = policy_scope(Store).geocoded.near([38.736946, -9.142685],40000,  :order => :distance).where("address ILIKE ?", "%Barcelona")

  	store_from_vegetable_ids = Product.where(category_id: 91).pluck(:store_id)
    @stores_vegetables = @stores.where(id: store_from_vegetable_ids)

    store_from_fruits_ids = Product.where(category_id: 92).pluck(:store_id)
    @stores_fruits = @stores.where(id: store_from_fruits_ids)


    @stores_best_rated = policy_scope(Store).where(stars: 5)
  end

  def dashboard
    current_user.first_name
    # current_user.stores
    # current_user.orders
    # current_user.reviews
  end
end

