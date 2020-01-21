class PassedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'question_id', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.current_question = nil if time_expired?

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

  def timer?
    test.timer?
  end

  def complete_before
    return unless timer?
    return if new_record?

    created_at + test.time_limit.minutes
  end

  def time_expired?
    # If the timer is not set the pass test time never expires
    timer? && Time.now > complete_before
  end

  private

  def before_validation_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    current_question? && correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    elsif current_question?
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def current_question?
    !!current_question
  end

  def time_left?
    !time_expired?
  end
end
