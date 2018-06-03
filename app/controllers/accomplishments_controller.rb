class AccomplishmentsController < ApplicationController

  before_action :require_login

  def index
    #code
  end

  def new
    @accomplishment = Accomplishment.new(user: current_user)
  end

  def create
    # take the day of the week entered in the form, and change the date if need be. Defaults to today. set a different datetime in the block.
    @accomplishment = Accomplishment.new(accomplishment_params) do |a|
      a.day = a.date_time.strftime('%A')
    end
  end

  def show
    #code
  end

  private

  def accomplishment_params
    params.require(:accomplishment).permit(:title, :effect, :date_time, day_ids: [])
  end
end
