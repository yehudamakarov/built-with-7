class ApplicationController < ActionController::Base

  def welcome
    @message = params[:message]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def redirect_because_logged_in
    if logged_in?
      redirect_to user_path(current_user, message: 'Already logged in.')
    end
  end

  helper_method :current_user, :logged_in?

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end
# Why do we makes methods private? Should these be?
  def require_login
    if logged_in?
      return
    else
      redirect_to root_path(message: 'Please Log In.')
    end
  end

  private

  def auth_hash
    @auth_hash ||= request.env["omniauth.auth"]
  end

end
