class AddStartDateToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :start_date, :datetime
  end
end
