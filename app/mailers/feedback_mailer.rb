class FeedbackMailer < ApplicationMailer
  default to: ENV['FEEDBACK_EMAIL']

  def leave_message(feedback)
    @email = feedback.email
    @message = feedback.message

    mail from: @email, subject: t('feedback_mailer.leave_message.subject')
  end
end
