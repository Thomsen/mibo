class MainController < ApplicationController
  def welcome
    @user = User.new
  end

  def index
    @statuses = Status.all

    u_id = flash[:u_id]
    puts "user id #{u_id}"
    @user = User.find_by_id(u_id)
    @user_id = @user.id
  end

  private


end

