class CreateAnswersCompetitionResultsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :answers_competition_results, id: false do |t|
      t.integer :answer_id
      t.integer :competition_result_id
    end
    
    add_index :answers_competition_results, [:answer_id, :competition_result_id], name: 'answer_result_index'
  end
  
  def self.down
    drop_table :answers_competition_results
  end
end