class CreateCompetitionResults < ActiveRecord::Migration
  def change
    create_table :competition_results do |t|
      t.references :user, index: true
      t.references :competition, index: true
      t.integer :score
      t.text :answers
      t.timestamps
    end
  end
end
