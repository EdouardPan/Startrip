class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :stars, dependent: :destroy
  has_many :star_reviews, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :human, presence: true

end
