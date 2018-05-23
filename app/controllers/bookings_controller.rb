class BookingsController < ApplicationController

  def create
    # To be added: add a check for availability of the planet
    @star = Star.find(params[:star_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.star = @star
    @booking.user = @user
    if @booking.save
      redirect_to profile_path
    else
      render 'stars/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path
  end

  private

  def booking_params
    params.require(:booking).permit(:arrival_date, :departure_date)
  end

end
