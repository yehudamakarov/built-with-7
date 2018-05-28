class SessionsController < ApplicationController
  def create
    unless @identity = Identity.find_from_auth(auth_hash)
      @identity = Identity.create_from_auth(auth_hash, current_user)
    end

    self.current_user = @identity.user
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
