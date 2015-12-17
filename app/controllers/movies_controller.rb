class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :check_admin!, only: [:edit, :update, :destroy]
  respond_to :html, :js
  before_filter :check_admin!, except: [:index, :show]

  def index
    @movies = Movie.all
    @rating = Rating.new
    @ratings = Rating.where("movie_id = ?", params[:id])
    respond_with(@movies)
  end

  def show
    @rating = Rating.new
    @ratings = Rating.where("movie_id = ?", params[:id])
    @movie = Movie.find(params[:id])
    @booking = Booking.new
    @bookings = @movie.bookings
    @movie_comment = MovieComment.new
    #@movie_comments = MovieComment.where("movie_id = ?", params[:id]).reverse
    @movie_comments = @movie.movie_comments.order('id DESC')
    respond_to do |format|
      format.js
    end
  end

  def new
    @movie = Movie.new
    respond_with(@movie)
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movies_path
  end

  def update
    @movie.update(movie_params)
    respond_with(@movie)
  end

  def destroy
    @movie.destroy
    respond_with(@movie)
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :director, :genre, :playtime, :published, :videocover, :trailerlink)
    end
end
