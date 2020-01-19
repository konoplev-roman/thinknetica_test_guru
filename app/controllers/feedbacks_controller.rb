class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbackMailer.leave_message(@feedback).deliver_now

      redirect_to root_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :message)
  end
end
