class StarsController < ApplicationController
  skip_after_action :verify_authorized, only: [:show, :top]

  def index
    @stars = Star.all.sample(5)
  end

  def new
  end

  def create
  end

  def top
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def search
    @stars = Star.where(constellation: params[:constellation])
  end

end
