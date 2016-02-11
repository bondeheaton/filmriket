class Press < ActiveRecord::Base
  mount_uploader :text_file, TextFileUploader
end
