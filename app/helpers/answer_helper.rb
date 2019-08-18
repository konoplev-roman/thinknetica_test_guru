module AnswerHelper
  def answer_header(answer)
    if answer.new_record?
      'Create New Answer'
    else
      'Edit Answer'
    end
  end
end
