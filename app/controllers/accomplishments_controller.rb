class AccomplishmentsController < ApplicationController

  before_action :require_login

  def index
    #code
  end

  def new
    @user = current_user
    @accomplishment = Accomplishment.new(user: @user, day: Time.zone.now.strftime('%A'))
  end

  def create

    # Sets the date_time of the accomplishment to the last occuring weekday specified on the form, using the time of day specified by the form.

    @accomplishment = Accomplishment.new(accomplishment_params) do |a|

      current_datetime = a.date_time_of_task_with_current_date
      a.date_time = a.date_find(current_datetime, accomplishment_params[:day])
      a.user = current_user
      a.save

    end

    redirect_to accomplishment_path(@accomplishment)
  end

  def show
    @accomplishment = Accomplishment.find(params[:id])
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private

  def accomplishment_params
    params.require(:accomplishment).permit(:title, :effect, :day, :date_time, day_ids: [])
  end

end
