class ClubMovie < ActiveRecord::Base
  belongs_to :user

  def access(user)
    self.videolink = 'inactive'
    self.active = 0
    self.user_id = user.id
  end
end
