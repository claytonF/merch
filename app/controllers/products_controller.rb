class ProductsController < ApplicationController
	before_action :find_product, except: [:index,:new,:create]

  def index
  	@products = Product.all
  end

  def show
  	
  end

  def new

    # only logged in users
    if current_user.present?
  	   @product = Product.new
    else
      flash[:error] = "You need to be loggined in to do this"
      redirect_to new_session_path
    end
  end

  def create
    # only logged in users
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
