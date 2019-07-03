class SetAnswerBodyAndQuestionAndCorrectNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :question_id, false)
    change_column_null(:answers, :correct, false)
  end
end
