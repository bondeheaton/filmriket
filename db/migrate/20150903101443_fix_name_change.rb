class FixNameChange < ActiveRecord::Migration
  def change
    rename_column :users, :adress, :address
  end
end
