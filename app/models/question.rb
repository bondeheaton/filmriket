class Question < ActiveRecord::Base
  belongs_to :competition
  has_many :answers
end
