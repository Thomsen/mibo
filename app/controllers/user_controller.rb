class UserController < ApplicationController
  def profile
  end

  def modify
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :loginname, :password)
  end
  
end
