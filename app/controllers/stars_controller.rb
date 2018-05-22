class StarsController < ApplicationController
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

end
