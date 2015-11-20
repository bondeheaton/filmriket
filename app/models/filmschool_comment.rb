class FilmschoolComment < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :filmschool
end
