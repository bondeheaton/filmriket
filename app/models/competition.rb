class Competition < ActiveRecord::Base
  has_many :questions
  has_many :competition_results
end