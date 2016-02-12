class CreatePresses < ActiveRecord::Migration
  def change
    create_table :presses do |t|
      t.string :text
      t.string :link

      t.timestamps
    end
  end
end
