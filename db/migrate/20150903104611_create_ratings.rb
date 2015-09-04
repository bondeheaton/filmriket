class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.references :movie, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
