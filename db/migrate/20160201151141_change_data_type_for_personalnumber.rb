class ChangeDataTypeForPersonalnumber < ActiveRecord::Migration
  def change
    change_column :users, :personalnumber, :string
  end
end
