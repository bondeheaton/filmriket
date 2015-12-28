class Upload < ActiveRecord::Base
  validates_presence_of :image
  belongs_to :club
  mount_uploader :image, ImageUploader
end
