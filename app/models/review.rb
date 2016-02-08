class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  belongs_to :club
  
  # setting review to inactive before upload is attached
  def access(user)
    self.active = 0
    self.user_id = user.id
    # Unless club is set in form from an admin
    unless self.club_id
      self.club_id = user.club_id
    end
  end
  
end
