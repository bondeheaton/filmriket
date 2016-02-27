class ClubsController < ApplicationController
  autocomplete :club, :name
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :check_admin!, except: [:show]

  respond_to :html, :js

  def index
    @clubs = Club.all
    respond_with(@clubs)
  end

  def show
    @users = @club.users
    @reviews = @club.reviews.where(active: 1)
    @club_movies = @club.club_movies.where(active: 1)
    @seen_movies = @club.seen_movies
    @hash = build_gmaps_markers
    
    @upload = Upload.new
    respond_with(@clubs)
  end

  def new
    @club = Club.new
    respond_with(@club)
  end

  def edit
  end

  def create
    @club = Club.new(club_params)
    @club.save
    @club.users.update_all(status: 5)
    respond_with(@club)
  end

  def update
    # Set all users status to 4 in case someone is removed from the club
    @club.users.update_all(status: 4)
    @club.update(club_params)
    @club.users.update_all(status: 5)
    respond_with(@club)
  end

  def destroy
    @club.destroy
    @club.users.update_all(status: 4)
    respond_with(@club)
  end

  private
    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit(:name, :description, :address, :zipcode, :points, user_ids: [])
    end
end
