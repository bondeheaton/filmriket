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

  # Status for registration form
  def status_values
    @status_values = [['Vill gå med i klubb', 1], ['Vill starta klubb', 2], ['Letar klubb', 3]]
  end
  
  # Prevent clubs from booking more than 3 movies.
  def club_bookings(club)
    count = []
    members = club.users
    members.each do |member|
      count.push(member.bookings.where(status: 0).count)
    end
    count.inject(:+)
  end
  
  # Returns clubs achievement score
  def club_achievement_score(club)
    achievement_score = [0]
    achievement_score.push(club.events.count)
    achievement_score.push(club.users.count)
    users.each do |user|
      achievement_score.push(user.reviews.where.not(videolink: "inactive").count)
      achievement_score.push(user.club_movies.where.not(videolink: "inactive").count)
    end
    achievement_score.inject(:+)
  end
  
  def user_in_club(club)
    current_user.access == 2 || current_user.club == club
  end
  
  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<iframe id="iframe-id" title="YouTube video player" src="http://www.youtube.com/embed/#{ youtube_id }?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>}
  end
  
end
