class News < ActiveRecord::Base
  default_scope { order('newsdate DESC') } 
end
