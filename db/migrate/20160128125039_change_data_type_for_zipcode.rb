class ChangeDataTypeForZipcode < ActiveRecord::Migration
  def change
    change_column :users, :zipcode, :string
  end
end
