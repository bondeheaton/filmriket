class AddColumnToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :banner, :string
  end
end
