class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @stores = policy_scope(Store).order(:name)
    # @stores = Store.geocoded

    # @markers = @stores.map do |store|
    #   {
    #     lat: store.latitude,
    #     lng: store.longitude,
    #     infoWindow: render_to_string(partial: "info_window", locals: { store: store })
    #     # image_url: helpers.asset_url('https://cdn.mos.cms.futurecdn.net/05ea615f11e300b074e248aa7378ff64.jpg')
    #   }
    # end
    # @stores = policy_scope(store).order(:name)
    # if params[:query].present?
    #   condition = "address @@ :query OR name @@ :query"
    #   @stores = policy_scope(Store).where(condition, query: "%#{params[:query]}%")
    # else
    #   @stores = policy_scope(Store).order(:name)
    # end
    # @stores = Garden.search_by_address_and_name(params[:query])
  end

  def show

  end

  def new
    @store = Store.new
    authorize @store
  end

  def create
    @store = Store.new(store_params)
    @store.user = current_user
    authorize @store
    if @store.save
      redirect_to stores_path, notice: 'Store was successfully created'
    else
      render :new
    end
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
    redirect_to user_stores_path, notice: 'Store was successfully destroyed'
  end

  private

  def set_store
    @store = Store.find(params[:id])
    authorize @store
  end

  def store_params
    params.require(:store).permit(:name, :address, :description, :website, :phone, :user_id)
  end
end
