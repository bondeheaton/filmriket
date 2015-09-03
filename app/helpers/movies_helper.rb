module MoviesHelper
  def rating_for_user
    if user_signed_in? and Rating.exists?(:user_id => current_user.id, :movie_id => @id)
      @rating = Rating.where("user_id = ? AND movie_id = ? ", current_user.id, @id).take
      return @rating.value
    else
      return 0
    end
  end
end
