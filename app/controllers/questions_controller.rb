class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def index
    result = @test.questions.pluck(:body)

    render plain: result.join("\n")
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_not_found
    render plain: 'Record was not found!!!'
  end
end
