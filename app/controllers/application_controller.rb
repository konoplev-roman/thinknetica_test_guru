class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def default_url_options
    { lang: (I18n.locale if I18n.locale != I18n.default_locale) }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)}
  end

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : tests_path
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def rescue_with_not_found
    flash.alert = t('record_not_found')

    redirect_to root_path
  end
end
