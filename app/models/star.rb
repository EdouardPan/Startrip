class Star < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :star_reviews, dependent: :destroy

  mount_uploader :photos, PhotoUploader

  array_of_constellations = [
    "Andromeda",
    "Cassiopeia",
    "Centaurus",
    "Cetus",
    "Circinus",
    "Lyra",
    "Microscopium",
    "Norma",
    "Octans",
    "Pavo",
    "Pegasus",
    "Tucana",
    "Ursa Major",
    "Virgo",
    "Volans",
    "Vulpecula"]

  validates :name, presence: true
  validates :constellation, presence: true,  inclusion: { in: array_of_constellations } # Needs to be completed later
  validates :water, presence: true, inclusion: { in: (0..100).to_a }
  validates :breathability, presence: true, inclusion: { in: (0..100).to_a }
  validates :asteroid_attack, presence:true, numericality: { in: (0..100).to_a }
  validates :description, presence: true, length: { minimum: 150 }
  validates :price_per_day, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
