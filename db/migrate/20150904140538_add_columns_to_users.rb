class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :integer
    add_column :users, :statusmessage, :string
  end
end
