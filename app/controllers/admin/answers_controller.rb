class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def destroy
    @answer.destroy

    redirect_to @answer.question
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to @answer.question
    else
      render :edit
    end
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def rescue_with_not_found
    render plain: 'Record was not found!!!'
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
