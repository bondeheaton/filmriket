class CreateJoinTableClubMoviesClubs < ActiveRecord::Migration
  def change
    create_join_table :club_movies, :clubs do |t|
      # t.index [:club_movie_id, :club_id]
      # t.index [:club_id, :club_movie_id]
    end
  end
end
