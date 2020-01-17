class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy edit update update_inline]

  def show; end

  def destroy
    @question.destroy

    redirect_to [:admin, @question.test], notice: t('.success')
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question.test], notice: t('.success')
    else
      render :edit
    end
  end

  def update_inline
    @test = @question.test

    if @question.update(question_params)
      redirect_to [:admin, @test], notice: t('.success')
    else
      render 'admin/tests/show'
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
