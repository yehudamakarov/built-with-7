class UsersController < ApplicationController
  before_action :redirect_because_logged_in, only: [:new]
  before_action :require_login, only: [:edit]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create_from_signup(signup_params)
    if @user.save
      current_user = @user
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.skip_password_validation = true
    @user.update(edit_params)
    if @user.save
      flash[:updated] = 'Update succesful.'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def edit_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def signup_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
