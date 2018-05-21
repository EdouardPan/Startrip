class Star < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :star_photos, dependent: :destroy
  has_many :star_reviews, dependent: :destroy

  validates :name, presence: true, uniqueness :true
  validates :constellation, presence: true,  inclusion: { in: ["Andromeda", "Antlia", "Apus"] } # Needs to be completed later
  validates :water, inclusion: { in: (0..100).to_a }
  validates :breathability, inclusion: { in: (0..100).to_a }
  validates :asteroid_attack, numericality: { in: (0..100).to_a }
  validates :description, presence: true, length: { minimum: 150 }
  validates :price_per_day, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
