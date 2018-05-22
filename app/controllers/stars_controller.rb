class StarsController < ApplicationController
  def index
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
