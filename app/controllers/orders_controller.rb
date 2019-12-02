class OrdersController < ApplicationController
  before_action :set_order, only: [:destroy, :show, :create, :new, :update]
  before_action :set_product_orders, only: [:create,:update]

  def index
    @orders = policy_scope(Order).where(user: current_user)
    @product_orders = ProductOrder.where(user: current_user)
    #@product_orders = ProductOrder.joins(:orders).where(:orders => {:user_id => current_user.id})
    # @stores = Store.joins(:products).where(:orders => {:user_id => current_user.id})

  end

  def show
    # @product_orders = ProductOrder.joins(:orders).where(:orders => {:user_id => current_user.id})
    @order = current_user.orders.find(params[:id])
  end

  def new
  end

  def create
    @order = Order.new
    @order.user = current_user

    amount = 0
    quantity = 0
    create_product_orders
    current_user.product_orders.each do |item|
      amount += item.product.price
      quantity += item.quantity
    end
    @order.quantity = quantity

    @order.amount = amount
    @order.save
    authorize @order
    # @order = Order.find(params[:order_id])
    # @order = Order.create!(amount: 0, state: 'pending', user_id: current_user)
    # redirect_to order_path(@order)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @order.id,
        amount: @order.amount_cents,
        currency: 'eur',
        quantity: @order.quantity
      }],
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  def edit
  end

  def update
    # amount = 0
    # @order.product_orders.each do |item|
    #   amount += item.price
    # end
    # @order.amount = amount
    # @order.update
    # authorize @order
    # redirect_to order_path(@order)
  end


  def destroy
    @order.destroy
    redirect_to orders_path, notice: 'Order was successfully destroyed'
  end

  private

  def create_product_orders
    params["order"]["product_order_ids"].each do |po|
      product_order = ProductOrder.find(po)
      product_order.order = @order
      product_order.save
    end

  end

  def set_order
    @order = Order.where(user: current_user)
    # @order.product_orders = ProductOrder.where(product_order_params)
    # @order = Order.find(order_params)
    authorize @order
    # authorize @product_orders
  end

  def set_product_orders
    # @product_orders = ProductOrder.where(product_order_params)
  end


  def order_params
    params.require(:order).permit(:amount, :state, :user_id)
  end

  def product_order_params
    # params.require(:product_order).permit(:quantity, :product_id, :order_id)
  end
end
