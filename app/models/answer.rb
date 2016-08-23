class Answer < ActiveRecord::Base
  belongs_to :question
  has_and_belongs_to_many :competition_results
  
  def mark_as_correct
    self.question.answers.update_all(correct: false)
    self.correct = true
    self.save
  end
  
end
