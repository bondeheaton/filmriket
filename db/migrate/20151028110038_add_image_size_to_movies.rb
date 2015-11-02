class AddImageSizeToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :image_size, :integer
  end
end
