class CreateStarPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :star_photos do |t|
      t.string :photo
      t.references :star, foreign_key: true

      t.timestamps
    end
  end
end
