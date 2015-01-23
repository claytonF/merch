class OrdersController < ApplicationController

	before_action :require_user # defined in app controller
	before_action :find_product, except: [:index, :show]
  def index
  	# list of all previous orders for current user
  end

  def show
  	# show the order as a receipt
  	
  	@order = Order.find(params["id"])
  	@product = @order.product
  end

  def new
		
  	@order = @product.orders.new
  end

  def create
  	@order = @product.orders.new(order_params)
  	@order.user = current_user

  	if @order.save

	  	# create a charge via Stripe
	  	Stripe.api_key = "sk_test_FFz1kWXp451kiROmvouqFQ64"

	  	Stripe::Charge.create(
		  :amount => @order.product.price_in_pence,
		  :currency => "gbp",
		  :card => @order.stripe_token, # obtained with Stripe.js,
		  :description => "charge for #{@order.product.name} purchased by #{@order.user.email}."
)

	  	# save a record of the purchase
	  	# redirect to receipt (show action)
	  	flash[:success] = "Thank you for your purchasing #{@product.name}. Enjoy your new planet, you God you!"
	  	redirect_to user_order_path(current_user, @order.product)

  	else
  		flash[:error] = "check your details and try again"
  		render :new
  	end
  end

  private

  def order_params
  	params.require(:order).permit(:stripe_token, :delivery_address)
  end

  def find_product
  	@product = Product.find(params["product_id"]) #if leave the product_id out the error it returns tells you what to look for
  end

end
