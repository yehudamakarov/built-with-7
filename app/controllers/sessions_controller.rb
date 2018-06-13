class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash
      @identity = Identity.get_or_create_identity(auth_hash, current_user)
      self.current_user = @identity.user
      flash[:login_notice] = 'You have succesfully logged in!'
      return redirect_to user_path(current_user)
    else
      if login_params
        @user = User.find_by(email: @login_params[:email])
        if @user.try(:password_digest)
          if @user.authenticate(@login_params[:password])
            flash[:login_notice] = 'You have succesfully logged in!'
            self.current_user = @user
            return redirect_to user_path(current_user)
          end
        else
          flash[:login_error] = 'Please try to log in with a service or double check your password.'
          return redirect_to login_path
        end
      else
        flash[:login_error] = 'Please make sure to enter both your email and password.'
        return redirect_to login_path
      end
    end
  end

  def destroy
    session.clear
    flash[:logout_notice] = 'You have succesfully logged out and cleared the session'
    redirect_to root_path
  end

  private

  def login_params
    @login_params = params.require(:user).permit(:email, :password)
    if @login_params[:email].blank? || @login_params[:password].blank?
      return nil
    else
      @login_params
    end
  end
end
