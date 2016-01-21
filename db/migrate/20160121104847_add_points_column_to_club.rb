class AddPointsColumnToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :points, :int
  end
end
