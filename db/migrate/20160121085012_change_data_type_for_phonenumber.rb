class ChangeDataTypeForPhonenumber < ActiveRecord::Migration
  def change
    change_column :users, :phonenumber, :string
  end
end