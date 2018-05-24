class AddCoordinatesToStars < ActiveRecord::Migration[5.2]
  def change
    add_column :stars, :latitude, :float
    add_column :stars, :longitude, :float
  end
end
