class SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super

    flash.notice = "Welcome, #{current_user.first_name} Guru!"
  end
end
