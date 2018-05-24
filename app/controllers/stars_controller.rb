class StarsController < ApplicationController
  before_action :set_star, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index, :search]

  def index
   @stars = policy_scope(Star)
   @constellation = Star.all.map{ |star| star.constellation }.uniq
  end

  # def new
  # end

  def create

    @star = Star.new(star_params)
    authorize @star
    @star.user = current_user
    if @star.save!
      redirect_to profile_path
    else
      render :new
    end
  end

  def top
  end

  def edit
    authorize @star
  end

  def update
    authorize @star
    if @star.update(star_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    authorize @star
    @star.destroy
    redirect_to profile_path
  end

  def show
    authorize @star
    @booking = Booking.new
    @review = StarReview.new
  end

  def search
    @stars = Star.where(constellation: params[:query][:constellation])
    authorize @stars


    # @stars = Star.where.not(latitude: nil, longitude: nil) : cas des lat /lng nil à gérer ensuite

    @markers = @stars.map do |star|
      {
        lat: star.latitude,
        lng: star.longitude#,
        # infoWindow: { content: render_to_string(partial: "/stars/map_box", locals: { star: star }) }
      }
    end
  end

  private

  def set_star
    @star = Star.find(params[:id])
  end

  def star_params
    params.require(:star).permit(:name, :constellation, :water, :breathability, :asteroid_attack, :daylight, :life_existence, :description, :price_per_day, :photos)
  end

end

