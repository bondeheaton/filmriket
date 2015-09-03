class AddClubRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :club, index: true
  end
end
