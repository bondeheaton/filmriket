class Movie < ActiveRecord::Base
  has_many :movie_comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :reviews
  has_many :bookings, dependent: :destroy
  mount_uploader :videocover, VideocoverUploader

  def average_rating
    @rating = "-"
    if ratings.length > 0
      @ratings = []
      ratings.each do |r|
        @ratings.push(r.value.to_f)
      end
      @rating = (@ratings.inject(:+) / ratings.length).round(1)
    end
    return @rating
  end

end
