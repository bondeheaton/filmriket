class Rating < ActiveRecord::Base
  belongs_to :movie, dependent: :destroy
  belongs_to :user
end
