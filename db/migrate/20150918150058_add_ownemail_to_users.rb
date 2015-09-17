class AddOwnemailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ownemail, :string
  end
end
