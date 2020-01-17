class PassedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'question_id', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def complited?
    current_question.nil?
  end

  def success?
    success_percent >= 85
  end

  def success_percent
    (correct_questions.to_f * 100 / test.questions.count).round(0)
  end

  def position_current_question
    test.questions.index(current_question) + 1
  end

  def progress
    (position_current_question * 100 / test.questions.count).round(0)
  end

  private

  def before_validation_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
