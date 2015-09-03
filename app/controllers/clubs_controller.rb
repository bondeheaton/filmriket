class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @clubs = Club.all
    respond_with(@clubs)
  end

  def show
    @clubs = Club.all

    @verifiedclubs = []

    @clubs.each do |club|
      if club.longitude
        @verifiedclubs.push(club)

      end
    end

    @hash = Gmaps4rails.build_markers(@verifiedclubs) do |club, marker|
      marker.lat club.latitude
      marker.lng club.longitude

      marker.infowindow "#{view_context.link_to club.name, club_path(club)}"

    end
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
    respond_with(@club)
  end

  def update
    @club.update(club_params)
    respond_with(@club)
  end

  def destroy
    @club.destroy
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
