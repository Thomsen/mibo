class WelcomeController < ApplicationController
  def index
    @user = User.new
  end

  def main
    @statuses = Status.all
    
    u_id = flash[:u_id]
    puts "user id #{u_id}"
    @user = User.find_by_id(u_id)
    @user_id = @user.id
    
  end

  def login
    unless request.get?
      username = params[:user][:username]
      password = params[:user][:password]
      @hint = "ok"
      @user = User.find_by_username(username)
      if @user.class == NilClass
        @hint = 'unregisted username!'
        redirect_to welcome_index_path
      elsif @user.password == password
        @hint = 'welcome back'
        puts "login user id #{@user.id}"
        redirect_to welcome_main_path, status: 301, flash: {u_id: @user.id}
      else
        @hint = 'login failed, please check up you info'
      end
      
    end
    
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end

