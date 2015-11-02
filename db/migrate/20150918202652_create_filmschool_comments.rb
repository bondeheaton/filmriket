class CreateFilmschoolComments < ActiveRecord::Migration
  def change
    create_table :filmschool_comments do |t|
      t.string :message
      t.references :user, index: true
      t.references :filmschool, index: true

      t.timestamps
    end
  end
end
