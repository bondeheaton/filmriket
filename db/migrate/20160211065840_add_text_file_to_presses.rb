class AddTextFileToPresses < ActiveRecord::Migration
  def change
    add_column :presses, :text_file, :string
  end
end
