class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :star

  validates :arrival_date, presence: true
  validates :departure_date, presence: true

  validate :date_order

  def total_price
    (self.departure_date - self.arrival_date).to_i * self.star.price_per_day
  end

  private

  def date_order
     if departure_date <= arrival_date
       errors.add(:departure_date, "cannot be before arrival date.")
     end
  end
end
