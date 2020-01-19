class Feedback
  include ActiveModel::Model

  attr_accessor :email, :message

  validates :email, presence: true, format: Devise::email_regexp
  validates :message, presence: true
end
