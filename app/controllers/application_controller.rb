class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # this makes the method available to the view
  helper_method :current_user, :current_user?

  # look for user using session data
  def current_user
  	# if there is session data, use it to lookup user
  	if session[:user_id].present?
  		User.find(session[:user_id])
  	end
  end

  # check if current user is logged in
  def current_user?
  	current_user.present?
  end

  # for actions that require user be logged in
  def require_user
    unless current_user?
      flash[:error] = "you must be logged in to do that."
      redirect_to new_session_path and return 
    end
  end

  # define action that checks for users 
  # and makes sure the user owns something
  def require_owner
    # check for current user
    current_user?
    # look for belongings - requires relationship between products and users - foreign key in product table



  end

end


