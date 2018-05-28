class SessionsController < ApplicationController
  def create
    @identity = get_identity(auth_hash)
    self.current_user = @identity.user

    redirect_to user_path(self.current_user)
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  def get_identity(auth_hash)
    if @identity = Identity.find_from_auth(auth_hash)
      return @identity
    else
      @identity = Identity.create_from_auth(auth_hash, self.current_user)
    end
  end

end
