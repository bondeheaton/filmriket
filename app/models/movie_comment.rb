class MovieComment < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :movie
end
