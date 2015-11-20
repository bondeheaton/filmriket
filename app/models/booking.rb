class Booking < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :movie
end
