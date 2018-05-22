class StarReviewsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @star_reviews = policy_scope(StarReview)
  end
end
