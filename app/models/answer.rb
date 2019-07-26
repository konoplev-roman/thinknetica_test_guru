class Answer < ApplicationRecord
  belongs_to :question

  validates :question, :body, presence: true
  validate :validate_count_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_count_answers
    errors.add(:base) if question.answers.count >= 4
  end
end
