class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true
      t.references :movie, index: true
      t.integer :status

      t.timestamps
    end
  end
end
