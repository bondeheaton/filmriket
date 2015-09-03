class Participants < ActiveRecord::Base
  belongs_to :event
  belongs_to :club
end
