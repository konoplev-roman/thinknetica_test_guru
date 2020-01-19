module QuestionHelper
  def question_header(question)
    if question.new_record?
      t('helpers.question.header.create', title: question.test.title)
    else
      t('helpers.question.header.edit', title: question.test.title)
    end
  end
end
