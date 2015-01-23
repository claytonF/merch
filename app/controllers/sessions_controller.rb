class SessionsController < ApplicationController
  def new
  end

  def create
		# get email from params
		email = params[:session][:email]
		# get password from params
		password = params[:session][:password]
		# get user from DB using email from params
		@user= User.find_by(email: email)
		# compare password from params with password_digest from DB
		if @user.present? and @user.authenticate(password) # bcrypt method
			# login 
			reset_session
			# put user id in session - rails will automatically send cookie to browser
			session[:user_id] = @user.id
			flash[:success] = "Welcome back #{@user.email}."
			redirect_to root_path

		else 
			render :new
			flash[:error] = "Login failed. Please try again"
		
		end

  end

  def destroy
  	#log out
  	reset_session
  	flash[:success] = "You have been logged out."
  	# can include html with .html_safe at the end of the flash statement
  	redirect_to root_path
  	# could do redirect_to :back to go back to previous page
  end
end
