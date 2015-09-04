class ClubMoviesController < ApplicationController
  before_action :set_club_movie, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @club_movies = ClubMovie.all
    respond_with(@club_movies)
  end

  def show
    respond_with(@club_movie)
  end

  def new
    @club_movie = ClubMovie.new
    respond_with(@club_movie)
  end

  def edit
  end

  def create
    @club_movie = ClubMovie.new(club_movie_params)
    @club_movie.save
    respond_with(@club_movie)
  end

  def update
    @club_movie.update(club_movie_params)
    respond_with(@club_movie)
  end

  def destroy
    @club_movie.destroy
    respond_with(@club_movie)
  end

  private
    def set_club_movie
      @club_movie = ClubMovie.find(params[:id])
    end

    def club_movie_params
      params.require(:club_movie).permit(:title, :description, :videolink, :active, :user_id)
    end
end
