class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :director
      t.string :genre
      t.integer :playtime
      t.integer :published
      t.string :imglink
      t.string :trailerlink

      t.timestamps
    end
  end
end
