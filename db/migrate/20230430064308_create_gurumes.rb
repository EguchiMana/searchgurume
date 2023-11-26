class CreateGurumes < ActiveRecord::Migration[6.1]
  def change
    create_table :gurumes do |t|
      t.string :name
      t.string :food_genre
      t.string :genre
      t.string :station
      t.integer :lat
      t.integer :lng
      t.text :about
      t.string :image
      t.integer :star

      t.timestamps
    end
  end
end
