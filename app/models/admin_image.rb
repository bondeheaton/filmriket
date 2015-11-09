class AdminImage < ActiveRecord::Base
  mount_uploader :img, AdminUploader
end
