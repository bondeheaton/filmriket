class AddClubToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :club, index: true
  end
end
