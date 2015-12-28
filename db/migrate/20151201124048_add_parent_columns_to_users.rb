class AddParentColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :parentphonenumber, :integer
    add_column :users, :parentfirstname, :string
    add_column :users, :parentlastname, :string
  end
end
