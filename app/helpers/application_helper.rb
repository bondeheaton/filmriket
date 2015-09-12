module ApplicationHelper
  def movies_to_pick
    @movies = Movie.all
  end

  def users
    @users = User.all
  end

  def clubs
    @clubs = Club.all
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def status_values
    @status_values = [['Vill gå med i klubb', 1], ['Vill starta klubb', 2], ['Letar klubb', 3]]
    return @status_values
  end

  def banner_colors
    @banner_colors = [["red", "red"], ["blue", "blue"], ["black", "black"], ["grey", "grey"], ["green", "green"]]
    return @banner_colors
  end
  
  def club_bookings(club)
    @count = []
    @members = club.users
    @members.each do |member|
      @count.push(member.bookings.count)
    end
    return @count.inject(:+)
  end
  
  def check_already_booked(movieid)
    @already_booked = false
    @user = current_user
    @club = @user.club
    @members = @club.users
    @members.each do |member|
      @bookings = member.bookings
      @bookings.each do |book|
        if book.movie_id == movieid
          @already_booked = true
        end
      end
    end
    return @already_booked
  end

  def comment_user_name(id)
    return User.find(id).firstname
  end

  def comment_user_avatar(id)
    return User.find(id).avatar
  end
  
  def club_achievement_score(club)
    @achievement_score = [0]
    @users = club.users
    if club.events
      @achievement_score.push(club.events.count)
    end
    if club.users
      @achievement_score.push(club.users.count)
    end
    @users.each do |user|
      if user.reviews
        @achievement_score.push(user.reviews.where.not(videolink: "inactive").count)
      end
      if user.club_movies
        @achievement_score.push(user.club_movies.where.not(videolink: "inactive").count)
      end
    end
    return @achievement_score.inject(:+)
  end
  
  def club_achievement_icon(club)
    @achievement_score = [0]
    @achievement_icon = "locked.png"
    @users = club.users
    if club.events
      @achievement_score.push(club.events.count)
    end
    if club.users
      @achievement_score.push(club.users.count)
    end
    @users.each do |user|
      if user.reviews
        @achievement_score.push(user.reviews.where.not(videolink: "inactive").count)
      end
      if user.club_movies
        @achievement_score.push(user.club_movies.where.not(videolink: "inactive").count)
      end
    end
    if @achievement_score.inject(:+) > 0
      @achievement_icon = "bronze_medal.png"
    end
    if @achievement_score.inject(:+) > 10
      @achievement_icon = "silver_medal.png"
    end
    if @achievement_score.inject(:+) > 20
      @achievement_icon = "gold_medal.png"
    end
    if @achievement_score.inject(:+) > 30
      @achievement_icon = "rainbow_medal.png"
    end
    return @achievement_icon
  end
  
  def current_user_helper
    return current_user
  end

  def club_seen_movies(movie)
    @club = Club.find(params[:id])
    @users = @club.users
    @ratings = [0]
    @users.each do |user|
      user.ratings.each do |ratings|
        if movie == ratings.movie_id
          @ratings.push(ratings.value)
        end
      end
    end
    return @ratings.inject(:+)
  end
  
  def user_in_club(club)
    if current_user.access == 2
      return true
    end
    if current_user.club == club
      return true
    else
      return false
    end
  end
  
  def users_without_club
    return User.where(club: nil)
  end

  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<div class="flex-video"><iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe></div>}
  end
  
end
