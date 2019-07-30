class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  skip_before_action :verify_authenticity_token, only: :destroy

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def show
    render plain: @question.body
  end

  def destroy
    @question.destroy
  end

  def new; end

  def create
    question = @test.questions.create!(question_params)

    redirect_to question
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_not_found
    render plain: 'Record was not found!!!'
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
