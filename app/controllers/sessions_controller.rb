class SessionsController < ApplicationController

  def new
    @message = params[:message]
  end

  def create
    if auth_hash
      @identity = get_or_create_identity(auth_hash)
      self.current_user = @identity.user
      return redirect_to user_path(self.current_user)
    else
      if login_params
        @user = User.find_by(email: login_params[:email])
        if @user.try(:password_digest)
          if @user.authenticate(login_params[:password])
            return self.current_user = @user
          end
        else
          return redirect_to login_path(message: 'Please try to log in with a service or double check your password.')
        end
      else
        return redirect_to login_path(message: 'Please make sure to enter both your email and password.')
      end
    end
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
    if params[:email].blank? || params[:password].blank?
      return nil
    else
      params.permit(:email, :password)
    end

  end

end
