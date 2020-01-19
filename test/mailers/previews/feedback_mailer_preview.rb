# Preview all emails at http://localhost:3000/rails/mailers/feedback_mailer
class FeedbackMailerPreview < ActionMailer::Preview
  def leave_message
    feedback = Feedback.new(email: 'user@example.com', message: 'Test message')

    FeedbackMailer.leave_message(feedback)
  end
end
