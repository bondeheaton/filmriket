class CreateJoinTableReviewClub < ActiveRecord::Migration
  def change
    create_join_table :reviews, :clubs do |t|
      # t.index [:review_id, :club_id]
      # t.index [:club_id, :review_id]
    end
  end
end
