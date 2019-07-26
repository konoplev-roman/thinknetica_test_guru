class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]

  def index
    result = @test.questions.pluck(:body)

    render plain: result.join("\n")
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end
end
