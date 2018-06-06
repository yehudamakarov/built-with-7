class AccomplishmentsController < ApplicationController

  before_action :require_login, only: [:new, :edit]


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
      @accomplishment = Accomplishment.new(user: @user, day: params[:day].capitalize)
    else
      @accomplishment = Accomplishment.new(user: @user, day: Time.zone.now.strftime('%A'))
    end
  end

  def create

    # Sets the date_time of the accomplishment to the last occuring weekday specified on the form, using the time of day specified by the form.
    @user = current_user
    @accomplishment = Accomplishment.new(accomplishment_params) do |a|
      current_datetime = a.date_time_of_task_with_current_date
      a.date_time = a.date_find(current_datetime, accomplishment_params[:day])
      a.user = @user
    end

    if @accomplishment.save
      redirect_to accomplishment_path(@accomplishment)
    else
      render :new
    end
  end

  def show
    @accomplishment = Accomplishment.find(params[:id])
  end

  def edit
    @user = current_user
    @accomplishment = Accomplishment.find(params[:id])
  end

  def update
    @accomplishment = Accomplishment.find(params[:id])
    @accomplishment.assign_attributes(accomplishment_params)
    day_of_week = @accomplishment.user.days.find_by(name: @accomplishment.date_time.strftime('%A'))

    @accomplishment.day = day_of_week.name
    if accomplishment_params[:day_ids].length <= 1
      @accomplishment.days << day_of_week
    end
    if @accomplishment.save
      redirect_to accomplishment_path(@accomplishment)
    else
      render :edit
    end
  end

  def destroy
    @accomplishment = Accomplishment.find(params[:id])
    @accomplishment.destroy
    flash[:deleted] = 'Accomplishment removed.'
    redirect_to user_path(current_user)
  end

  private

  def accomplishment_params
    params.require(:accomplishment).permit(:title, :effect, :day, :date_time, day_ids: [])
  end

end
