class CreateClubMovies < ActiveRecord::Migration
  def change
    create_table :club_movies do |t|
      t.string :title
      t.string :description
      t.string :videolink
      t.integer :active
      t.references :user, index: true

      t.timestamps
    end
  end
end
