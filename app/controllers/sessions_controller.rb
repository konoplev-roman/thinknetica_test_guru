class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to(cookies[:return_to] || root_path)

      cookies.delete(:return_to)
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please!'

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path
  end
end
