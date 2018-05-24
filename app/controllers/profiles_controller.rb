class ProfilesController < ApplicationController

  def dashboard
    authorize :profile, :dashboard?
    #--- Renting a star
    # Instance variable to index a user's bookings
    @my_info = current_user
    @my_bookings = current_user.bookings
    @my_stars = current_user.stars
    @new_star = Star.new
    @tab = params[:tab]

    # Link to delete/cancel a booking

    #--- Renting out a star

    # Instance variable to index one's stars
    # Instance variable to make a new star
  end
end
