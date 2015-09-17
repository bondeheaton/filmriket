class CreateFilmschools < ActiveRecord::Migration
  def change
    create_table :filmschools do |t|
      t.string :title
      t.string :description
      t.string :videolink

      t.timestamps
    end
  end
end
