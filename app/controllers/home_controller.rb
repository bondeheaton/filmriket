class HomeController < ApplicationController
  def index

  end

  def admin_log
    @reviews = Review.all
    @club_movies = ClubMovie.all
    @movie_comments = MovieComment.all
  end
end
