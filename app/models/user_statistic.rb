class UserStatistic < ApplicationRecord
  belongs_to :user

  #virtual atributes
  def total_questions
    self.right_question + self.wrong_question
  end

  def income
    if total_questions != 0
     (self.right_question.to_f/self.total_questions.to_f)*100
    else
      0
    end
  end

  #Class Methods
  def self.set_statistic(answer, current_user)
    if !!current_user
      user_statistic = UserStatistic.find_or_create_by(user: current_user)
      answer.correct? ? user_statistic.right_question += 1 : user_statistic.wrong_question +=1
      user_statistic.save
    end
  end
end
