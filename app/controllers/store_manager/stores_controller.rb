class StoreManager::StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = policy_scope(Store).order(:name)
  end

  def show
    authorize ProductOrder
    return unless @product_order.nil?

    @product_order = ProductOrder.new
    @product_order.save
  end

  def edit
  end

  def update
    if @store.update(store_params)
      redirect_to store_path(@store), notice: 'Store was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path(@store), notice: 'Store was successfully destroyed'
  end

  private

  def set_store
    @store = Store.find(params[:id])
    authorize @store
  end

  def store_params
    params.require(:store).permit(:name, :address, :description, :website, :phone, :user_id, :picture)
  end

  def create_pictures
    photos = params.dig(:store, :pictures) || []
    photos.each do |photo|
      @store.pictures.create(photo: photo)
    end
  end
end
