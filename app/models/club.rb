class Club < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  has_many :users
  has_many :participants
  has_many :events, :through => :participants
  
  
  def self.score(club)
    @users = club.users
    return @users.first
  end
end
