class SessionsController < ApplicationController

  def new

  end

  def create
    if login_params
      @user = User.find_by(email: login_params[:email])
      if @user.authenticate(login_params[:password])
        self.current_user = @user
      else
        redirect_to login_path, notice: 'Please try to login with a service or double check your password.'
      end
    else
      @identity = get_or_create_identity(auth_hash)
      self.current_user = @identity.user
    end

    redirect_to user_path(self.current_user)
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  def get_or_create_identity(auth_hash)
    if @identity = Identity.find_from_auth(auth_hash)
      return @identity
    else
      @identity = Identity.create_from_auth(auth_hash, self.current_user)
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

end
