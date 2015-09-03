class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.integer :personalnumber
      t.integer :phonenumber
      t.string :avatar
      t.string :adress
      t.string :city
      t.integer :zipcode
      t.string :parentmail
      t.integer :access

      t.timestamps
    end
  end
end
