class StarReview < ApplicationRecord
  belongs_to :user
  belongs_to :star
  validates :rating, inclusion: { in: (1..5).to_a }
  validates :comment, length:  { maximum: 500 }
end
