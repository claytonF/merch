class ProductsController < ApplicationController
	before_action :find_product, except: [:index,:new,:create]

  def index
  	@products = Product.all
  end

  def show
  	
  end

  def new
    # only logged in users
    require_user
  	@product = Product.new
  end

  def create
    # only logged in users - require user is in app controller
    require_user
  	@product = Product.new(product_params)
  	if @product.save
  		flash[:success] = "a new product was successfully created."
  		redirect_to product_path(@product)
  	else
  		flash[:error] = "Sorry. There was a problem, please try again."
  		render:new
  	end
  end

  def edit
    require_user
    # only logged in users and user is owner
  end

  def update
    # only logged in users and user is owner
  	if @product.update(product_params)
  		flash[:success] = "'#{@product.name}' was updated."
  		redirect_to product_path(@product)
  	else
  		flash[:error] = "Something went wrong. Please check the form and try again."
  		render :edit
  	end
  end

  def destroy
    # only logged in users and user is owner
  	@product.destroy
  	flash[:success] = "'@product.name' was deleted."
  	@product = nil
  	redirect_to root_path
  end

  private
  def product_params
  	#whitelisted form data
  	params.require(:product).permit(:name, :description, :price_in_pence, :image)
  end

  def find_product
  	#query to read a record from the DB
  	@product = Product.find(params["id"])
  end
end
