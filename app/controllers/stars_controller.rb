class StarsController < ApplicationController
  skip_after_action :verify_authorized, only: [:show, :top]

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

end
