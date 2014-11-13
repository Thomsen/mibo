class MainsController < ApplicationController
  def welcome
    @user = User.new
  end

  def index
#    u_id = flash[:u_id]
    u_id = session[:user_id]
    puts "user id #{u_id}"
    @statuses = Content.where.not(user_id: u_id)
    @user = User.find_by_id(u_id)
    @user_id = @user.id
  end

  private


end

