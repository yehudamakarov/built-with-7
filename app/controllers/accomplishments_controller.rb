class AccomplishmentsController < ApplicationController

  before_action :require_login

  def index
    #code
  end

  def new
    @accomplishment = Accomplishment.new
    @user = current_user
  end

  def create
    binding.pry
  end

  def show
    #code
  end
end
