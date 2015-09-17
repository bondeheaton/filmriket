class FilmschoolComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :filmschool
end
