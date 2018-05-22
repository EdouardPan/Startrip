class StarPhoto < ApplicationRecord
  belongs_to :star
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
