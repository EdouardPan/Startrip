class StarReview < ApplicationRecord
  belongs_to :user
  belongs_to :star
  validates :rating, inclusion: { in: (0..5).to_a }
  validates :comment, length:  { minimum: 4 }
end
