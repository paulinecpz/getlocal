class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    # @stores =.with_distance_to(point).order('distance')
  # location_ids = Location.near([lat, lng], 1, units: :km).map(&:id)
  # @stores = Store.where("location_id IN (?)", location_ids)

    # @stores = policy_scope(Store).near(:latitude, :longitude, 8_000_000 , order: 'distance')

    @stores = policy_scope(Store).order(:name)
    @stores = Store.geocoded

    update_map
    # @stores = policy_scope(store).order(:name)
    if params[:query].present?
      condition = "address @@ :query OR name @@ :query"
      @stores = policy_scope(Store).where(condition, query: "%#{params[:query]}%")

      update_map


    else
      @stores = policy_scope(Store).order(:name)
    end

    if params[:category_id].present?
      store_from_category_ids = Product.where(category_id: params[:category_id]).pluck(:store_id)
      @stores = @stores.where(id: store_from_category_ids)

      update_map
    end

    # @stores = Store.search_by_address_and_name(params[:query])
  end

# def distances
#     location  = Site.find params[ :id ]
#     stores   = Store.current
#     distances = []

#     stores.map do |store|
#       distance = Haversine.distance(site.address.latitude, site.address.longitude, store.address.latitude, store.address.longitude)
#       distances << {
#         name: store.name,
#         value: distance
#       }
#     end

#     render json: {
#       distances: distances.to_json
#     }

#   end


  def vegetables_stores
    @stores = policy_scope(Store).where(:category => 'vegetables')

    update_map
  end

#   def fruits_stores
#     @stores = policy_scope(Store).where(:category => 'fruits')

#     update_map
#   end

#   def bio_stores
#     @stores = policy_scope(Store).where(:category => 'bio')

#     update_map
#   end

#   def meat_stores
#     @stores = policy_scope(Store).where(:category => 'meat')

#     update_map
#   end

#   def fish_stores
#     @stores = policy_scope(Store).where(:category => 'fish')

#     update_map
#   end

#   def cheese_stores
#     @stores = policy_scope(Store).where(:category => 'cheese')

#     update_map
#   end

  def show
    @order = Order.new
    @product_orders = ProductOrder.joins(:product).where(:products => {:store => @store})
    # @product_orders = ProductOrder.joins(:orders).where(:orders => {:user_id => current_user.id})
    @markers = {
        lat: @store.latitude,
        lng: @store.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { store: @store }),
        image_url: helpers.asset_url('pin.png')
      }
      @markers = [@markers]
      if user_signed_in? && current_user.orders.present?
        @orders = current_user.orders
      end

    @stores = policy_scope(Store).order(:name)

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
      current_user.role = 'store_manager'
      current_user.save
      create_pictures
      redirect_to store_manager_store_path(@store), notice: 'Store was successfully created'
    else
      render :new
    end
  end

  private

  def set_store
    @store = Store.find(params[:id])
    authorize @store
  end

  def update_map
    @markers = @stores.map do |store|
    {
      lat: store.latitude,
      lng: store.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { store: store }),
      image_url: helpers.asset_url('pin.png')
    }
    end
  end

  def store_params
    params.require(:store).permit(:name, :address, :description, :website, :phone, :user_id, :picture, :latitude, :longitude)
  end

  def create_pictures
    photos = params.dig(:store, :pictures) || []
    photos.each do |photo|
      @store.pictures.create(photo: photo)
    end
  end
end
