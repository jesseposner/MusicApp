class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user
  before_action :logged_in_redirect, only: [:new, :create]

  private

  def log_in!(user)
    user.reset_session_token
    session[:session_token] = user.session_token
    flash[:notice] = "Success!"
    redirect_to user_url(user)
  end

  def current_user
    return nil unless session[:session_token]
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    return false unless session[:session_token]
    session[:session_token] == current_user.session_token
  end

  def logged_in_redirect
    redirect_to user_url(current_user) if logged_in?
  end
end
