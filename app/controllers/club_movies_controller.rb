class ClubMoviesController < ApplicationController
  before_action :set_club_movie, only: [:edit, :update, :destroy, :show_club_movie]
  before_filter :authenticate_user!, except: [:index, :show_club_movie, :show_review]
  before_filter :check_admin!, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    club_movies = ClubMovie.all
    reviews = Review.all
    @videos = (club_movies + reviews).sort_by(&:created_at).reverse
    respond_with(@club_movies)
  end

  def show_club_movie
    respond_to do |format|
      format.js
    end
  end

  def show_review
    @review = Review.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def new
    @club_movie = ClubMovie.new
    respond_with(@club_movie)
  end

  def edit
  end
  
  def upload
    club_movie = ClubMovie.find(params[:club_movie_id])
    club_name = club_movie.club.name
    title = club_movie.title.to_s
    club_movie.title = title
    club_movie.save
    # If video got link it should not upload anything to youtube instead redirect to after-upload-path
    if club_movie.videolink
      redirect_to club_path(club_movie.club)
    else
      # Youtube-connection
      client = YouTubeIt::Client.new(:username => "filmriket@gmail.com", :password => "", :dev_key => "")
      paramshash = {:title => title, :description => "Filmriket", :category => "People", :keywords => ["Filmriket"], :private => true}
      @upload_info = client.upload_token(paramshash, club_movie_attach_url)
      respond_with(club_movie_attach_path)
    end
  end

  def attach
    club_movie = ClubMovie.find(params[:club_movie_id])
    club_movie.videolink = params[:id]
    club_movie.save
    redirect_to club_path(@club_movie.club)
  end
  

  def create
    @club_movie = ClubMovie.new(club_movie_params)
    @club_movie.access(current_user)
    @club_movie.save
    redirect_to club_movie_upload_path(@club_movie)
  end

  def update
    @club_movie.update(club_movie_params)
    redirect_to club_movies_path
  end

  def destroy
    @club_movie.destroy
    redirect_to :back
  end

  private
    def set_club_movie
      @club_movie = ClubMovie.find(params[:id])
    end

    def club_movie_params
      params.require(:club_movie).permit(:title, :description, :videolink, :active, :user_id, :club_id)
    end
end
