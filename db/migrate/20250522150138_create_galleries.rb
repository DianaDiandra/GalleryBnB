class CreateGalleries < ActiveRecord::Migration[7.2]
  def change
    create_table :galleries do |t|
      t.string :image
      t.text :description
      t.string :artist
      t.date :date

      t.timestamps
    end
  end
end
