module MoviesHelper
  
  # Displaying users own rating on movie-show
  def rating_for_user
    if user_signed_in? and Rating.exists?(:user_id => current_user.id, :movie_id => @id)
      @rating_value = Rating.where("user_id = ? AND movie_id = ? ", current_user.id, @id).take.value
    else
      return 0
    end
  end
  
  def display_videocover(movie)
	  if movie.image_size == 1
		  image_tag(movie.videocover, size: "280x382") 
    else
		  image_tag(movie.videocover, size: "280x280")
    end
  end
  
end
