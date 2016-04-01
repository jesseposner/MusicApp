class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  
  def create
    @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password])

    if @user.nil?
      flash[:errors] = ["invalid username or password"]
      redirect_to new_session_url
    else
      log_in!(@user)
    end
  end

  def new
    @user = User.new
  end

  def destroy
    current_user.reset_session_token
    session[:session_token] = nil
    flash[:notice] = "Logged Out!"
    redirect_to new_session_url
  end
end
