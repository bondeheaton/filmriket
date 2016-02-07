class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  
  # setting review to inactive before upload is attached
  def access(user)
    self.videolink = 'inactive'
    self.active = 0
    self.user_id = user.id
  end
  
end
