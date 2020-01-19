module AnswerHelper
  def answer_header(answer)
    if answer.new_record?
      t('helpers.answer.header.create')
    else
      t('helpers.answer.header.edit')
    end
  end
end
