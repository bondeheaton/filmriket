class Club < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  has_many :users
  has_many :participants, dependent: :destroy
  has_many :events, through: :participants, dependent: :destroy
  has_many :uploads, dependent: :destroy
  has_many :club_movies
  has_many :reviews
  
  validates :points, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  
  def seen_movies
    seen_movies = Movie.find(users.joins(:ratings).pluck(:movie_id).uniq)
  end
  
  def verified_clubs
    verified_clubs = Club.where.not(longitude: nil)
    # Set self to first element for google-maps center
    verified_clubs.unshift(self).uniq if longitude
  end
  
  def check_bookings?
    awaiting_bookings_count = users.joins(:bookings).where("bookings.status = 0").count
    awaiting_bookings_count < 3
  end
  
  def achievement_score
    achievement_score = [0]
    achievement_score.push(events.count)
    achievement_score.push(users.count)
    achievement_score.push(reviews.where.not(active: 0).count)
    achievement_score.push(club_movies.where.not(active: 0).count)
    achievement_score.push(points)
    achievement_score.inject(:+)
  end
    
  def achievement_icon
    case achievement_score
    when 0..9
      achievement_icon = "bronze_medal.png"
    when 10..19
      achievement_icon = "silver_medal.png"
    when 20..29
      achievement_icon = "gold_medal.png"
    else
      achievement_icon = "rainbow_medal.png"
    end
  end
  
end
