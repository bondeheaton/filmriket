class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :zipcode

      t.timestamps
    end
  end
end
