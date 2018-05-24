class BookingsController < ApplicationController

  def create
    # To be added: add a check for availability of the planet
    @star = Star.find(params[:star_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.star = @star
    @booking.user = @user
    @booking.trip_price = @booking.total_price
    if @booking.save
      redirect_to profile_path
    else
      render 'stars/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to profile_path
  end

  private

  def booking_params
    params.require(:booking).permit(:arrival_date, :departure_date)
  end

end
