class AddCountryToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :country, :string
  end
end
