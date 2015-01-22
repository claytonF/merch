class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create]

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome #{@user.email}"
  		redirect_to user_path(@user)
  	else
  		flash[:error] = "something went wrong, try again"
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @user.update(user_params)
  		flash[:success] = "Your profile has been successfully updated"
  		redirect_to user_path(@user)
  	else
  		flash[:error] = "something went wrong, try again"
  		render :edit
  	end
  end

  def destroy
  	@user.destroy
  	flash[:success] = "Your profile has been deleted"
  	@user = nil
  	redirect_to root_path
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def find_user
  	@user = User.find(params["id"])
  end

end
