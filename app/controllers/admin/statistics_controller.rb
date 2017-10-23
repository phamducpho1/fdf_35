class Admin::StatisticsController < ApplicationController
  def index
     @user_support  = Supports::UserSupport.new
  end
end
