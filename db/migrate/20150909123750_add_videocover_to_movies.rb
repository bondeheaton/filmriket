class AddVideocoverToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :videocover, :string
  end
end
