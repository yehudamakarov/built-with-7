class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  helper_method :current_user, :logged_in?

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end

end
