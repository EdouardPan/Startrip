class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :star, foreign_key: true
      t.date :arrival_date
      t.date :departure_date
      t.integer :trip_price
      t.string :status

      t.timestamps
    end
  end
end
