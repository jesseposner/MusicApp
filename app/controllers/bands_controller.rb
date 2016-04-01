class BandsController < ApplicationController
  before_action :logged_out_redirect

  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @band = Band.find_by_id(params[:id])
  end

  def update
  end

  def show
  end
end
