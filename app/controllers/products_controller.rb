class ProductsController < ApplicationController
	before_action :find_product, except: [:index,:new,:create]

  def index
  	@products = Product.all
  end

  def show
  	
  end

  def new
  	@product = Product.new
  end

  def create
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
  end

  def update
  	if @product.update(product_params)
  		flash[:success] = "'#{@product.name}' was updated."
  		redirect_to product_path(@product)
  	else
  		flash[:error] = "Something went wrong. Please check the form and try again."
  		render :edit
  	end
  end

  def destroy
  	@product.destroy
  	flash[:success] = "'@product.name' was deleted."
  	@product = nil
  	redirect_to root_path
  end

  private
  def product_params
  	#whitelisted form data
  	params.require(:product).permit(:name, :description, :price_in_pence)
  end

  def find_product
  	#query to read a record from the DB
  	@product = Product.find(params["id"])
  end
end
