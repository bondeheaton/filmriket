class CreateMovieComments < ActiveRecord::Migration
  def change
    create_table :movie_comments do |t|
      t.text :message
      t.references :user, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
