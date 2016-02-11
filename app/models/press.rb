class Press < ActiveRecord::Base
  mount_uploader :text_file, TextFileUploader
  validates :text, presence: true
  validates :link, presence: true
  validates :press_date, presence: true
  
  default_scope { order('press_date DESC') } 
  
end
