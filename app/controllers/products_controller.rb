class ProductsController < ApplicationController
  before_action :set_store, only: [:create, :new, :edit, :destroy, :update]
  before_action :set_product, only: [:edit, :destroy, :update]

  def index
    @products = Product.where(product_params)
  end

  def show
  end

  def new
    @product = Product.new
    @product.store = @store
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.store = @store
    authorize @product
    if @product.save
      redirect_to store_manager_store_path(@store)
    else
      render :new
    end
  end

  def edit
    authorize @product
  end

  def update
    authorize @product
    if @product.update(product_params)
      redirect_to store_manager_store_path(@store), notice: 'Product was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to store_manager_store_path(@store), notice: 'Product was successfully destroyed'
  end

  private

  def product_params
    params.require(:product).permit(:name, :stock, :price, :category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_store
    @store = Store.find(params[:store_id])
  end
end
