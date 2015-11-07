class ClubsController < ApplicationController
  autocomplete :club, :name
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user!

  respond_to :html, :js

  def index
    @clubs = Club.all
    respond_with(@clubs)
  end

  def show
    @clubs = Club.all
    @club = Club.find(params[:id])
    @users = @club.users
    @seen_movies = []
    @reviews = []
    @club_movies = []

    @users.each do |users|
      users.ratings.each do |ratings|
        @seen_movies.push(ratings.movie)
      end
    end

    @users.each do |user|
      user.reviews.each do |review|
        @reviews.push(review)
      end
    end

    @users.each do |users|
      users.club_movies.each do |club_movie|
        @club_movies.push(club_movie)
      end
    end

    @seen_movies = @seen_movies.uniq

    @user = current_user

    @verifiedclubs = []
    if @club.longitude
      @verifiedclubs.push(@club)
    end
    @clubs.each do |club|
      unless club == @club
        if club.longitude
          @verifiedclubs.push(club)
        end
      end
    end

    @hash = Gmaps4rails.build_markers(@verifiedclubs) do |club, marker|
      marker.lat club.latitude
      marker.lng club.longitude
      marker.picture({
              :url     => "../assets/#{Club.achievement_icon(club)}",
              :width   => 32,
              :height  => 32
              })
      marker.infowindow "#{view_context.link_to club.name, club_path(club)}"

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
    @users = @club.users
    @users.each do |user|
      user.update_attributes(:status => 5)
    end
    respond_with(@club)
  end

  def update
    @current_users = @club.users
    @current_users.each do |user|
      user.update_attributes(:status => 4)
    end
    @club.update(club_params)
    @users = @club.users
    @users.each do |user|
      user.update_attributes(:status => 5)
    end
    respond_with(@club)
  end

  def destroy
    @club.destroy
    @users = @club.users
    @users.each do |user|
      user.update_attributes(:status => 4)
    end
    respond_with(@club)
  end

  private
    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit(:name, :description, :address, :zipcode, user_ids: [])
    end
end
