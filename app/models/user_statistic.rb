class UserStatistic < ApplicationRecord
  belongs_to :user

  #virtual atributes
  def total_questions
    self.right_question + self.wrong_question
  end

  def income
     (self.right_question.to_f/self.total_questions.to_f)*100
  end
end
