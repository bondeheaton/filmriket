class CompetitionResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition
  has_and_belongs_to_many :answers
end
