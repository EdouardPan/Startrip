class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.string :name
      t.string :constellation
      t.integer :water
      t.integer :breathability
      t.integer :asteroid_attack
      t.integer :daylight
      t.boolean :life_existence
      t.text :description
      t.integer :price_per_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
