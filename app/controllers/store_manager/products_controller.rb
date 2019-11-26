class StoreManager::ProductsController < ApplicationController
  def index
    @products = Product.where(product_params)
  end

  def show
  end

  def new
    @store = Store.find(params[:store_id])
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @store = Store.find(params[:store_id])
    @product.store_id = @store.id
    if @product.save
      redirect_to store_path(@store)
    else
      render :new
    end
  end

  def edit
    @product = Product.new(product_params)
  end

  def update
    if @product.update(product_params)
      redirect_to store_manager_store_product_path(@product), notice: 'Product was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    @store = Store.find(params[:store_id])
    redirect_to stores_path(@store), notice: 'Product was successfully destroyed'
  end

  private

  def product_params
    params.require(:product).permit(:name, :stock, :price)
  end
end
