class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :check_admin!, except: [:create]
  respond_to :html

  def index
    @ratings = Rating.all
    respond_with(@ratings)
  end

  def show
    respond_with(@rating)
  end

  def new
    @rating = Rating.new
    respond_with(@rating)
  end

  def edit
  end

  def create
    if Rating.exists?(:user_id => params[:rating][:user_id], :movie_id => params[:rating][:movie_id])
      rating = Rating.where('user_id = ? AND movie_id = ? ', params[:rating][:user_id], params[:rating][:movie_id]).take
      rating.value = params[:rating][:value]
      rating.save
    else
      rating = Rating.new(rating_params)
      rating.save
    end
    respond_to do |format|
      format.js
    end
  end

  def update
    @rating.update(rating_params)
    respond_with(@rating)
  end

  def destroy
    @rating.destroy
    respond_with(@rating)
  end

  private
  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:value, :movie_id, :user_id)
  end
end