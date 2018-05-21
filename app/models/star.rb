class Star < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :star_photos, dependent: :destroy
  has_many :star_reviews, dependent: :destroy

  #ksjfhjlfdhfdjlhdfb
end
