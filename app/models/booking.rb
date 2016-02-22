class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  
  def save_booking(user)
    club = Club.find(user.club)
    awaiting_bookings_count = club.users.joins(:bookings).where("bookings.status = 0").count
    if awaiting_bookings_count < 3
      self.user_id = user.id
      self.status = 0
      self.save
    end
  end
  
end