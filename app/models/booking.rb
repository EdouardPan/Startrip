class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :star

  validates :arrival_date, presence: true
  validates :departure_date, presence: true

  # validates :date_order

  # def date_order
  #   if departure_date <= arrival_date
  #     errors.add(:departure_date, "cannot be before arrival date.")
  #   end
  # end

end
