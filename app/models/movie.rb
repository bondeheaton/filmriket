class Movie < ActiveRecord::Base
  has_many :comments
  has_many :ratings
  has_many :reviews

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

  def user_rating
    return ratings.find_by_user_id(current_user.id)
  end
end
