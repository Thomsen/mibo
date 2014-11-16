class UsersController < ApplicationController

  def create
    @user = User.create(user_params)  # new to create
    if @user.save
      redirect_to '/'
    else
      render template: 'users/_register' # redirect_to no transfer
    end
  end

  def follow
    @user_id = session[:user_id]
    @firend = User.new(firend_params)
    @firend_id = @firend.id
    @user_relation = UserRelation.new(:user_id => @user_id, :firend_id => @firend_id)
    
  end

  def login
    unless request.get?
      username = params[:user][:username]
      password = params[:user][:password]
      @hint = "ok"
      @user = User.find_by_username(username)
      if @user.class == NilClass
        @hint = 'unregisted username!'
        redirect_to mains_welcome_path
      elsif @user.password == password
        @hint = 'welcome back'
        puts "login user id #{@user.id}"
        session[:user_name] = username
        session[:user_id] = @user.id
        redirect_to mains_index_path, status: 301, flash: {u_id: @user.id}
      else
        @hint = 'login failed, please check up you info'
      end
    end
  end

  def logout
    reset_session
    redirect_to mains_welcome_path
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :portrait_uri)
  end

end
