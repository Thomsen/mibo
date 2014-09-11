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
      render template: 'user/_register' # redirect_to no transfer
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end
