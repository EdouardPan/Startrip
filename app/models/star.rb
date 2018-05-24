class Star < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :star_reviews, dependent: :destroy

  mount_uploader :photos, PhotoUploader

  CONSTELLATIONS = {
    "Andromeda" => { lat: 49.803410, lng: 3.397971 },
    "Cassiopeia" => { lat: 53.068435, lng: -2.306685 },
    "Centaurus" => { lat: 51.014601, lng: 39.573192 },
    "Cetus" => { lat: 12.276913, lng: 2.725042 },
    "Circinus" => { lat: -0.108518, lng: 31.091736 },
    "Lyra" => { lat: -28.174289, lng: 24.641790 },
    "Microscopium" => { lat: 24.980492, lng: 78.870300 },
    "Norma" => { lat:23.397129, lng: 87.890070 },
    "Octans" => { lat: 10.632978, lng: 106.402027 },
    "Pavo" => { lat: 24.781159, lng: 112.554366 },
    "Pegasus" => { lat: 36.946630, lng: 115.238115 },
    "Tucana" => { lat: -37.224830, lng: 144.686962 },
    "Ursa Major" => { lat: 24.790076, lng: 55.445177 },
    "Virgo" => { lat: -33.244487, lng: -71.165585 },
    "Volans" => { lat: -33.409720, lng: -58.113833},
    "Vulpecula" => { lat: 37.829077 , lng: -121.488808 }
  }

  validates :name, presence: true
  validates :constellation, presence: true,  inclusion: { in: CONSTELLATIONS.keys } # Needs to be completed later
  validates :water, presence: true, inclusion: { in: (0..100).to_a }
  validates :breathability, presence: true, inclusion: { in: (0..100).to_a }
  validates :asteroid_attack, presence:true, numericality: { in: (0..100).to_a }
  validates :description, presence: true, length: { minimum: 5 }
  validates :price_per_day, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def coordinates(constellation)
    self.latitude = CONSTELLATIONS[constellation][:lat] + rand(-0.5..0.5)
    self.longitude = CONSTELLATIONS[constellation][:lng] + rand(-0.5..0.5)
  end

end
