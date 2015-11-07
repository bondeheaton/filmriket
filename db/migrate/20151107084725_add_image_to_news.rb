class AddImageToNews < ActiveRecord::Migration
  def change
    add_column :news, :img, :string
  end
end
