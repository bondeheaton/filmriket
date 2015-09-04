class Club < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  has_many :users
  has_many :events, :through => :participants
end
