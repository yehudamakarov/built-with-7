class DaysController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:index]

  def index
    @days_of_the_week = DateTime::DAYNAMES
  end

  def day_of_week_index
    @days = Day.where(name: params[:day])
    @name_of_day = params[:day]
  end

  def show
    if params[:user_id]
      @day = User.find(params[:user_id]).days.find(params[:id])
    else
      @day = Day.find(params[:id])
    end
  end

  def today
    @day = current_user.days.find_by(name: Time.zone.now.strftime('%A'))
  end
end
