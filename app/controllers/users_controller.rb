class UsersController < ApplicationController
  before_action :redirect_because_logged_in, only: [:new]
  before_action :require_login, only: [:edit]
  before_action :set_user, only: [:show, :edit, :update, :destroy]


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
  end

  def edit
  end

  def update
    @user.skip_password_validation = true
    @user.update(edit_params)
    if @user.save
      flash[:updated] = 'Update succesful.'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destory
    flash[:deleted] = 'You have successfully deleted your account'
    session.clear
    redirect_to root_path
  end

  def with_most_unique_accomplishments
    @users = User.with_most_unique_accomplishments(params[:amount])
    flash[:showing] = 'Showing Users with most unique accomplishments'
    render :index
  end

  def with_bussiest_week
    @users = User.with_bussiest_week(params[:amount])
    flash[:showing] = 'Showing Users with the bussiest week.'
    render :index
  end

  private

  def edit_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def signup_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
