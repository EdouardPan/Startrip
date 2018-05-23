class StarsController < ApplicationController
  before_action :set_star, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index, :search]

  def index
   @stars = policy_scope(Star)
   @constellation = Star.all.map{ |star| star.constellation }
  end

  # def new
  # end

  def create
    @star = Star.new(star_params)
    @star.user = current_user
    if @star.save!
      redirect_to star_path(@star)
    else
      render :new
    end
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
    @stars = Star.where(constellation: params[:query][:constellation])
    authorize @stars
  end

  private

  def set_star
    @star = Star.find(params[:id])
  end

  def star_params
    params.require(:star).permit(:name, :constellation, :water, :breathability, :asteroid_attack, :daylight, :life_existence, :description, :price_per_day, :photos)
  end

end

