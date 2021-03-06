class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :is_admin


  def index
    if current_user
  	@user = User.find(session[:current_user])
    else
    
    end
  end

  def current_user
  	# User.find(session[:current_user]) if session([:current_user])
    User.find_by(id: session[:current_user])
  end

  def authenticate
  		redirect_to sessions_new_path unless session[:current_user]
  end

end
