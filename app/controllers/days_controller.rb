class DaysController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:index]

  def index
  end

  def show
  end

  def today
    @day = current_user.days.find_by(name: Time.zone.now.strftime('%A'))
  end
end
