class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true
      t.string :answer
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
