class AddDiscusslinkToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :discusslink, :string
  end
end
