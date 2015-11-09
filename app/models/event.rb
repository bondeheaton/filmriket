class Event < ActiveRecord::Base
  has_many :participants
  has_many :clubs, :through => :participants
  mount_uploader :img, ImageUploader
end
