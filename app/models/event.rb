class Event < ActiveRecord::Base
  has_many :clubs, :through => :participants
end
