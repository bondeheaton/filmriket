class ClubMovie < ActiveRecord::Base
  belongs_to :user
  
  # setting club_movie to inactive before upload is attached
  def access(user)
    self.videolink = 'inactive'
    self.active = 0
    self.user_id = user.id
  end
  
end
