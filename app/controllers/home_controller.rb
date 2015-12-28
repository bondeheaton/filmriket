class HomeController < ApplicationController
  before_filter :check_admin!, only: [:admin_log]

  def index

  end

  def admin_log
    @reviews = Review.all
    @club_movies = ClubMovie.all
    @movie_comments = MovieComment.all
    @uploads = Upload.all
  end

  def filmriket

  end

  def about
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
      marker.picture({
                         :url     => ActionController::Base.helpers.asset_path(Club.achievement_icon(club)),
                         :width   => 32,
                         :height  => 32
                     })
      marker.infowindow "#{view_context.link_to club.name, club_path(club), 'data-no-turbolink' => true}"

    end
  end

  def contact

  end

end
