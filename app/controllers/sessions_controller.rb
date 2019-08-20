class SessionsController < Devise::SessionsController
  after_action :custom_welcome, only: :create

  private

  def custom_welcome
    flash.notice = I18n.t('devise.sessions.custom_signed_in', name: current_user.name) if flash.key?(:notice)
  end
end
