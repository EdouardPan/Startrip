class StarPhoto < ApplicationRecord
  belongs_to :star
  validates :photo, presence: true
end
