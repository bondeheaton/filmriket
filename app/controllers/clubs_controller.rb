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
    clubs = Club.all
    @users = @club.users
    
    @seen_movies = []
    @reviews = @club.reviews.where(active: 1)
    @club_movies = @club.club_movies.where(active: 1)

    # Extract users seen-movies, reviews and club_movies to combine to club-stats
    @users.each do |user|
      user.ratings.each do |ratings|
        @seen_movies.push(ratings.movie)
      end
    end
    
    @seen_movies = @seen_movies.uniq
    
    # Check clubs for coordinates
    @verifiedclubs = []
    if @club.longitude
      @verifiedclubs.push(@club)
    end
    clubs.each do |film_club|
      unless film_club == @club
        if film_club.longitude
          @verifiedclubs.push(film_club)
        end
      end
    end
    
    # Create markers for google-map for each club with verified coordinates
    @hash = Gmaps4rails.build_markers(@verifiedclubs) do |club, marker|
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
    users = @club.users
    users.each do |user|
      user.update_attributes(:status => 5)
    end
    respond_with(@club)
  end

  def update
    current_users = @club.users
    current_users.each do |user|
      user.update_attributes(:status => 4)
    end
    @club.update(club_params)
    users = @club.users
    users.each do |user|
      user.update_attributes(:status => 5)
    end
    respond_with(@club)
  end

  def destroy
    @club.destroy
    users = @club.users
    users.each do |user|
      user.update_attributes(:status => 4)
    end
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
