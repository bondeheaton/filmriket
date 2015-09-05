class Participant < ActiveRecord::Base
  belongs_to :club
  belongs_to :event
end
