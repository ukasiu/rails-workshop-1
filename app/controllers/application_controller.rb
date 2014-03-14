class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      nil
    end
  end

  def logged_in?
    current_user != nil
  end

  def authorize
    if !logged_in? or current_user.email != "ukasiu@gmail.com"
      raise User::NotAuthorized
    end
  end

  rescue_from User::NotAuthorized do |e|
    redirect_to root_path, :alert => "Not authorized!"
  end
end

