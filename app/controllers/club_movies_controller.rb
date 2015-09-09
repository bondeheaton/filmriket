class ClubMoviesController < ApplicationController
  before_action :set_club_movie, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

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
  
  def upload
    @club_movies = ClubMovie.find(params[:club_movie_id])
    @user = User.find(@club_movies.user_id)
    @club_name = Club.find(@user.club_id).name
    @title = @club_movies.title.to_s
    @description = @club_movies.description
    @client = YouTubeIt::Client.new(:username => "shorts@live.se", :password =>  "filmriket", :dev_key => "AI39si5QCJpA99I-VxTU1Q-wiggLXaAdT2n1WKw-fJqlIhyrGxjdeDK5gMgoCX1wbSbku2CLBPg8BWaDMsNhr6L0hzD148Lnog")
    @paramshash = {:title => @title, :description => @description, :category => "People", :keywords => ["Filmriket"], :private => true}
    @upload_info = @client.upload_token(@paramshash, club_movie_attach_url)
    @club_movies.title = @title
    @club_movies.save
    respond_with(club_movie_attach_path)
  end

  def attach
    @club_movie = ClubMovie.find(params[:club_movie_id])
    @user = User.find(@club_movie.user_id)
    @club_name = Club.find(@user.club_id).name
    @client = YouTubeIt::Client.new(:username => "shorts@live.se", :password =>  "filmriket", :dev_key => "AI39si5QCJpA99I-VxTU1Q-wiggLXaAdT2n1WKw-fJqlIhyrGxjdeDK5gMgoCX1wbSbku2CLBPg8BWaDMsNhr6L0hzD148Lnog")
    @lastvideo = @client.my_videos.videos.first
    @club_movie.videolink = params[:id]
    @club_movie.save
    redirect_to club_path(current_user.club_id)
  end
  

  def create
    @club_movie = ClubMovie.new(club_movie_params)
    @club_movie.save
    redirect_to club_movie_upload_path(@club_movie)
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
