class Club < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  has_many :users
  has_many :participants, dependent: :destroy
  has_many :events, :through => :participants, dependent: :destroy
  has_many :uploads, dependent: :destroy
  has_many :club_movies
  has_many :reviews
  
  validates :points, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  
  
  def self.score(club)
    @users = club.users
    return @users.first
  end
  
  def self.achievement_icon(club)
    achievement_score = [0]
    achievement_score.push(club.events.count)
    achievement_score.push(club.users.count)
    achievement_score.push(club.reviews.where.not(active: 0).count)
    achievement_score.push(club.club_movies.where.not(active: 0).count)
    achievement_score.push(club.points)

    case achievement_score.inject(:+)
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
