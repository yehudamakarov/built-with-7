class DaysController < ApplicationController

  before_action :require_login, only: [:today]
  
  def index
    @days_of_the_week = DateTime::DAYNAMES
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
    render :show
  end
end
