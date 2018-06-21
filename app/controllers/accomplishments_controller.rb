class AccomplishmentsController < ApplicationController

  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_accomplishment, only: [:show, :edit, :update, :destroy]


  def index
    @accomplishments = Accomplishment.all
  end

  def day_of_week_index
    @days = Day.where(name: params[:day])
    @name_of_day = params[:day]
  end

  def new
    @user = current_user
    if params[:day]
      @accomplishment = Accomplishment.new(day: params[:day].capitalize)
    else
      @accomplishment = Accomplishment.new(day: Time.zone.now.strftime('%A'))
    end
  end

  def create
    @user = current_user
    @accomplishment = Accomplishment.new_from_params(accomplishment_params, @user)
    if @accomplishment.save
      redirect_to accomplishment_path(@accomplishment)
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @accomplishment }
    end
  end

  def edit
    @user = current_user
  end

  def update
    @accomplishment.update_from_params(accomplishment_params)
    if @accomplishment.save
      redirect_to accomplishment_path(@accomplishment)
    else
      render :edit
    end
  end

  def destroy
    @accomplishment.destroy
    flash[:deleted] = 'Accomplishment removed.'
    redirect_to user_path(current_user)
  end

  private

  def accomplishment_params
    params.require(:accomplishment).permit(:title, :effect, :day, :date_time, day_ids: [])
  end

  def set_accomplishment
    @accomplishment = Accomplishment.find(params[:id])
  end

end
