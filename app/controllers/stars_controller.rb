class StarsController < ApplicationController
  before_action :set_star, only: [:show, :edit, :update, :destroy]
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
    authorize @star
    @booking = Booking.new
  end

  def search
    @stars = Star.where(constellation: params[:query])
    authorize @stars
  end

  private

  def set_star
    @star = Star.find(params[:id])
  end

end
