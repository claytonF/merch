class ProductsController < ApplicationController
	before_action :require_user, only: [:new,:create]
  before_action :find_product, except: [:index,:new,:create]
  before_action :require_owner, only: [:edit,:update,:destroy]

  def index
  	@products = Product.all
  end

  def show
  end

  def new
    # only logged in users
    
  	@product = current_user.products.new
  end

  def create
    # only logged in users - require user is in app controller
    
  	@product = current_user.products.new(product_params)
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
        #require_owner(@product) # @product is set in find_product - below
  end

  def update
    # only logged in users and user is owner
    #require_owner(@product)

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
    #require_owner(@product)

  	@product.destroy
  	flash[:success] = "'#{@product.name}' was deleted."
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

  # define action that checks for users 
  # and makes sure the user owns something
  def require_owner
    # check for current user
    if current_user?
      # use current user to look for belongings
      # compare product argument with what we get back from current_user.products
      # long form - product.user == current_user
      unless @product.user == current_user
        flash[:error] = "You can only manage products that you own."
        redirect_to root_path and return
      end

    else
      flash[:error] = "You must be logged in to do this."
      redirect_to new_session_path and return

    end
    # look for belongings - requires relationship between products and users - foreign key in products table

  end

end
