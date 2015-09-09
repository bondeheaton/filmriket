class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def upload
    @review = Review.find(params[:review_id])
    @user = User.find(@review.user_id)
    @club_name = Club.find(@user.club_id).name
    @movie = Movie.find(@review.movie_id).title
    @title = ("Filmriket - " + @club_name + " recenserar " + @movie).to_s
    @description = @review.description
    @client = YouTubeIt::Client.new(:username => "shorts@live.se", :password =>  "filmriket", :dev_key => "AI39si5QCJpA99I-VxTU1Q-wiggLXaAdT2n1WKw-fJqlIhyrGxjdeDK5gMgoCX1wbSbku2CLBPg8BWaDMsNhr6L0hzD148Lnog")
    @paramshash = {:title => @title, :description => @description, :category => "People", :keywords => ["Filmriket"], :private => true}
    @upload_info = @client.upload_token(@paramshash, review_attach_url)
    @review.title = @title
    @review.save
    respond_with(review_attach_path)
  end

  def attach
    @review = Review.find(params[:review_id])
    @user = User.find(@review.user_id)
    @club_name = Club.find(@user.club_id).name
    @movie = Movie.find(@review.movie_id).title
    @client = YouTubeIt::Client.new(:username => "shorts@live.se", :password =>  "filmriket", :dev_key => "AI39si5QCJpA99I-VxTU1Q-wiggLXaAdT2n1WKw-fJqlIhyrGxjdeDK5gMgoCX1wbSbku2CLBPg8BWaDMsNhr6L0hzD148Lnog")
    @lastvideo = @client.my_videos.videos.first
    @review.videolink = params[:id]
    @review.save
    redirect_to club_path(current_user.club_id)

  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to review_upload_path(@review)
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :description, :videolink, :active, :user_id, :movie_id)
    end
end
