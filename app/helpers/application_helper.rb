module ApplicationHelper
  def movies_to_pick
    @movies = Movie.all
  end

  def users
    @users = User.all
  end
end
