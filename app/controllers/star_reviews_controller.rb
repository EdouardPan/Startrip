class StarReviewsController < ApplicationController

  def create
    @star = Star.find(params[:star_id])
    @star_review = StarReview.new(starreview_params)
    @star_review.star = @star
    if @star_review.save
      redirect_to star_path(@star)
    else
      # Add instance variable of the stars#show once the controller stars finished
      @booking = Booking.new
      @review = @star_review
      render 'stars/show'
    end
  end

  # To be deleted and integrated in the stars#show
  def index
    @star_reviews = policy_scope(StarReview)
  end

  private

  def starreview_params
    params.require(:star_review).permit(:rating, :comment)
  end
end
