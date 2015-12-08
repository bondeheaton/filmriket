class FilmschoolComment < ActiveRecord::Base
  validates :message, presence: true

  belongs_to :user
  belongs_to :filmschool
end
