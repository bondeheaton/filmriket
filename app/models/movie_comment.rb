class MovieComment < ActiveRecord::Base
  validates :message, presence: true

  belongs_to :user, dependent: :destroy
  belongs_to :movie
end
