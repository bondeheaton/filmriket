class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.references :club, index: true

      t.timestamps
    end
  end
end
