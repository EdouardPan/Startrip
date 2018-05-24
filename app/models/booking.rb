class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :star

  validates :arrival_date, presence: true
  validates :departure_date, presence: true

  validate :date_order
  validate :date_blocker

  def total_price
    (self.departure_date - self.arrival_date).to_i * self.star.price_per_day
  end


  private

  def date_order
     if departure_date <= arrival_date
       errors.add(:departure_date, "cannot be before arrival date.")
     end
  end

  def date_blocker
    self.star.bookings.each do |other_booking|
      if self.arrival_date >= other_booking.arrival_date && self.arrival_date < other_booking.departure_date
        errors.add(:arrival_date, "falls on someone else's trip")
      elsif self.departure_date > other_booking.arrival_date && self.departure_date <= other_booking.departure_date
        errors.add(:departure_date, "falls on someone else's trip")
      end
    end
  end
end
