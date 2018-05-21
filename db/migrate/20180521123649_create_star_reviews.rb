class CreateStarReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :star_reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :user, foreign_key: true
      t.references :star, foreign_key: true

      t.timestamps
    end
  end
end
