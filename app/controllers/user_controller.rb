class UserController < ApplicationController
  def profile
  end

  def modify
  end

  def create
    @user = User.new
  end
  
end
