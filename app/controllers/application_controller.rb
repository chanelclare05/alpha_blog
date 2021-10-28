class ApplicationController < ActionController::Base
  #allows action to be available to the views aswell as the controllers
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end 

  def logged_in?
    #Turns the variable current_user into a boolean value
    !!current_user 
  end 

  def require_user
    if !logged_in? 
      flash[:alert] = "You must be logged in to perform that action."
      redirect_to login_path
    end 
  end 

end
