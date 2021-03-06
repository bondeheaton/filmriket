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

  def user_in_club(club)
    current_user.access == 2 || current_user.club == club
  end
  
  def current_admin?
    current_user && current_user.access == 2
  end
  
  def current_club_user?
    current_user && (current_user.club || current_user.access == 2)
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

  def youtube_embed_popup(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<iframe id="video-popup" title="YouTube video player" src="http://www.youtube.com/embed/#{ youtube_id }?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>}
  end
  
end
