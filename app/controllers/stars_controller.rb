class StarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :search]

  def index
   @stars = policy_scope(Star)
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
    @stars = Star.where(constellation: params[:query])
    authorize @stars
  end

end
