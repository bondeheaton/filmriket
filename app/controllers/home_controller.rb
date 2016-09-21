class HomeController < ApplicationController
  before_filter :check_admin!, only: [:admin_log]

  def index
    @hash = build_gmaps_markers
    @competition = Competition.first
    @challenge = Competition.last
    @competition_result = CompetitionResult.new
    @user_competition_result = @competition.competition_results.find_by_user_id(current_user) if @competition
  end

  def admin_log
    @reviews = Review.all
    @club_movies = ClubMovie.all
    @uploads = Upload.all
    
    movie_comments = MovieComment.all
    filmschool_comments = FilmschoolComment.all
    unsorted_comments = movie_comments + filmschool_comments
    @comments = unsorted_comments.sort_by(&:created_at).reverse
  end

  def filmriket
  end

  def about
    @presses = Press.all
    verifiedclubs = Club.where.not(longitude: nil)
    @hash = build_gmaps_markers
    client = Instagram.client(access_token: "1394749750.2a8d1ea.778623c9461246b8a308284e31dd49c2")
    @media_photos = client.user_recent_media(count: 29)
  end

  def contact
  end

  def competition
    @competition = Competition.first
    @competition_result = CompetitionResult.new
    @challenge = Competition.last
    @user_competition_result = @competition.competition_results.find_by_user_id(current_user) if @competition
  end

end
