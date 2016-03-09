class News < ActiveRecord::Base
  default_scope { order('newsdate DESC') } 
  validates :newsdate, presence: true
end
