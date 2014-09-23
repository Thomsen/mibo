class WelcomeController < ApplicationController
  def index
    @user = User.new
  end

  def main
    
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
        redirect_to welcome_main_path
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

