class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  def access(user)
    self.videolink = 'inactive'
    self.active = 0
    self.user_id = user.id
  end
end
