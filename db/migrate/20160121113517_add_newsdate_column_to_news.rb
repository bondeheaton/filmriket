class AddNewsdateColumnToNews < ActiveRecord::Migration
  def change
    add_column :news, :newsdate, :datetime
  end
end
