class StarsController < ApplicationController
  before_action :set_star, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index, :search]

  def index
   @stars = policy_scope(Star)
   @constellation = Star.all.map{ |star| star.constellation }.uniq
  end

  def create
    @star = Star.new(star_params)
    @star.coordinates(@star.constellation)
    authorize @star
    @star.user = current_user
    if @star.save
      redirect_to star_path(@star)
    else
      @my_info = current_user
      @my_bookings = current_user.bookings
      @my_stars = current_user.stars
      @new_star = @star
      render 'profiles/dashboard'
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
      redirect_to profile_path(tab: "stars")
    else
      render :edit
    end
  end

  def destroy
    authorize @star
    @star.destroy
    redirect_to profile_path(tab: "stars")
  end

  def show
    authorize @star
    @booking = Booking.new
    @review = StarReview.new
  end

  def search
    @constellation = params[:query][:constellation]
    @stars = Star.where(constellation: params[:query][:constellation])
    if !params[:query][:water].nil?
      if params[:query][:water] == 'Yes'
        @stars = @stars.where("water > 0")
      else
        @stars = @stars.where("water = 0")
      end
    end
    if !params[:query][:life_existence].nil?
      if params[:query][:life_existence] == 'Yes'
        @stars = @stars.where(life_existence: true)
      else
        @stars = @stars.where(life_existence: false)
      end
    end
    if !params[:query][:asteroid_attack].nil?
      if params[:query][:asteroid_attack] == 'Yes'
        @stars = @stars.where("asteroid_attack > 0")
      else
        @stars = @stars.where("asteroid_attack = 0")
      end
    end

    authorize @stars


    # @stars = Star.where.not(latitude: nil, longitude: nil) : cas des lat /lng nil à gérer ensuite

    @markers = @stars.map do |star|
      {
        lat: star.latitude,
        lng: star.longitude,
        icon: ActionController::Base.helpers.asset_path("star.png"),
        infoWindow: { content: render_to_string(partial: "/stars/map_box", locals: { star: star }) }
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

