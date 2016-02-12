class AddPressdateToPresses < ActiveRecord::Migration
  def change
    add_column :presses, :press_date, :datetime
  end
end
