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
    
    # Create markers for google-map for each club with verified coordinates
    @hash = Gmaps4rails.build_markers(@club.verified_clubs) do |club, marker|
      marker.lat club.latitude
      marker.lng club.longitude
      marker.picture({
              :url     => ActionController::Base.helpers.asset_path(Club.achievement_icon(club)),
              :width   => 32,
              :height  => 32
              })
      marker.infowindow "#{view_context.link_to club.name, club_path(club), 'data-no-turbolink' => true}"
    end

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
