class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :message
      t.references :user, index: true

      t.timestamps
    end
  end
end
