class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]
  def show
    @user = self.current_user
  end
end
