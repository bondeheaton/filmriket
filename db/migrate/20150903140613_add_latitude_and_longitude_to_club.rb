class AddLatitudeAndLongitudeToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :latitude, :float
    add_column :clubs, :longitude, :float
  end
end
