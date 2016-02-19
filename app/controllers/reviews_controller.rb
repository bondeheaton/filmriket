class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_filter :check_admin!, except: [:new, :create, :upload, :attach]

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
    review = Review.find(params[:review_id])
    club_name = review.club.name
    movie = Movie.find(review.movie_id).title
    title = ("Filmriket - " + club_name + " recenserar " + movie).to_s
    review.title = title
    review.save
    # If video got link it should not upload anything to youtube instead redirect to after-upload-path
    if review.videolink
      redirect_to club_path(review.club)
    else
      # Youtube-connection
      client = YouTubeIt::Client.new(:username => "filmriket@gmail.com", :password => "", :dev_key => "")
      paramshash = {:title => title, :description => "Filmriket", :category => "People", :keywords => ["Filmriket"], :private => true}
      @upload_info = client.upload_token(paramshash, review_attach_url)
      respond_with(review_attach_path)
    end
  end

  def attach
    review = Review.find(params[:review_id])
    # Setting videolink after upload is complete and video-url is available
    review.videolink = params[:id]
    review.save
    redirect_to club_path(@review.club)
  end

  def create
    @review = Review.new(review_params)
    # Sets review videolink to inactive before video it attached if user wont attach video
    @review.access(current_user)
    @review.save
    redirect_to review_upload_path(@review)
  end

  def update
    @review.update(review_params)
    redirect_to club_movies_path
  end

  def destroy
    @review.destroy
    redirect_to :back
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :description, :videolink, :active, :user_id, :movie_id, :club_id)
    end
end
