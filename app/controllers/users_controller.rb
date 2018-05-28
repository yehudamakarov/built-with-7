class UsersController < ApplicationController
  before_action :redirect_because_logged_in, only: [:new]
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]


  def new
    @user = User.new
  end

  def create
    if @user = User.create_from_signup(signup_params)
      current_user = @user
      redirect_to user_path(@user)
    else
      render :new
    end

  end

  def show
    @user = params[:user_id]
  end

  private

  def signup_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
