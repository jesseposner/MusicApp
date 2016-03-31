class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      @user.reset_session_token
      session[:session_token] = @user.session_token
      flash[:notice] = "Success!"
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
