class UsersController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  before_action :logged_out_redirect, only: :show

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    redirect_to user_url(current_user) if params[:id].to_i != current_user.id
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
