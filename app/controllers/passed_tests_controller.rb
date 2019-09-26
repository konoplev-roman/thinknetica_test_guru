class PassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_passed_test, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.complited?
      TestsMailer.completed_test(@passed_test).deliver_now

      redirect_to result_passed_test_path(@passed_test)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@passed_test.current_question).call

    if result.success?
      Gist.create(user: @passed_test.user, question: @passed_test.current_question, url: result.url)

      link = ActionController::Base.helpers.link_to(t('.see'), result.url, target: '_blank')

      flash.notice = t('.success', link: link)
    else
      flash.alert = t('.failure')
    end

    redirect_to @passed_test
  end

  private

  def find_passed_test
    @passed_test = PassedTest.find(params[:id])
  end
end
