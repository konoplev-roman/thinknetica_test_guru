class SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super

    flash.notice = t('welcome', name: current_user.first_name)
  end
end
