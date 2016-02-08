class Club < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  has_many :users
  has_many :participants, dependent: :destroy
  has_many :events, :through => :participants, dependent: :destroy
  has_many :uploads, dependent: :destroy
  has_many :club_movies
  has_many :reviews

  def self.score(club)
    @users = club.users
    return @users.first
  end
  
  def self.achievement_icon(club)
    @achievement_score = [0]
    @achievement_icon = "locked.png"
    @users = club.users
    if club.events
      @achievement_score.push(club.events.count)
    end
    if club.users
      @achievement_score.push(club.users.count)
    end
    @users.each do |user|
      if user.reviews
        @achievement_score.push(user.reviews.where.not(videolink: "inactive").count)
      end
      if user.club_movies
        @achievement_score.push(user.club_movies.where.not(videolink: "inactive").count)
      end
    end
    @achievement_score.push(club.points)
    if @achievement_score.inject(:+) > 0
      @achievement_icon = "bronze_medal.png"
    end
    if @achievement_score.inject(:+) > 10
      @achievement_icon = "silver_medal.png"
    end
    if @achievement_score.inject(:+) > 20
      @achievement_icon = "gold_medal.png"
    end
    if @achievement_score.inject(:+) > 30
      @achievement_icon = "rainbow_medal.png"
    end
    return @achievement_icon
  end
  
end
