class AddClubToClubMovies < ActiveRecord::Migration
  def change
    add_reference :club_movies, :club, index: true
  end
end
