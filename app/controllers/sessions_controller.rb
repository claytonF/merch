class SessionsController < ApplicationController
  def new
  end

  def create
		# get password from params
		email = params[:session][:email]
		password = params[:session][:password]
		# get user from DB using email from params
		@user= User.find_by(email: email)
		# compare password from params with password_digest from DB
		if @user.present? and @user.authenticate(password) # bcrypt method
			# login 
			reset_session
			session[:user_id] = @user.id
			flash[:success] = "Welcome back #{@user.email}."
			redirect_to root_path

		else 
			render :new
			flash[:error] = "Login failed. Please try again"
		
		end

  end
end
