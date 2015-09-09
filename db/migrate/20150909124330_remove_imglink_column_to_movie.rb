class RemoveImglinkColumnToMovie < ActiveRecord::Migration
  def change
    remove_column :movies, :imglink, :string
  end
end
