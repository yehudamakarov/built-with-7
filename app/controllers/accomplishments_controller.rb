class AccomplishmentsController < ApplicationController

  before_action :require_login

  def index
    #code
  end

  def new
    @user = current_user
    @accomplishment = Accomplishment.new(user: @user)

  end

  def create
    @accomplishment = Accomplishment.new(accomplishment_params)
    binding.pry
  end

  def show
    #code
  end

  private

  def accomplishment_params
    params.require(:accomplishment).permit(:title, :effect, :date_time, day_ids: [])
  end
end
