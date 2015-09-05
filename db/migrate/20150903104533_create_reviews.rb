class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.string :videolink
      t.integer :active
      t.references :user, index: true

      t.timestamps
    end
  end
end
