class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authen_by_username(params[:session][:username], params[:session][:password])

    if user.nil?
      flash.now[:error] = "Invalid username/password combination"
      render :new
    else
      sign_in user
      redirect_to mains_index_path
    end
    
  end

  def destroy
  end

  private
  def user_params
    params(:session).permit(:username, :form_password)
  end
  
end
