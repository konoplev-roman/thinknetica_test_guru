class QuestionsController < ApplicationController
  def index
    result = Test.find(params[:test_id]).questions.pluck(:body)

    render plain: result.join("\n")
  end
end
