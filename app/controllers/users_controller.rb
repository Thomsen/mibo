class UsersController < ApplicationController

  def create
    @user = User.create(params_new_user)  # new to create
    if @user.save
      redirect_to '/', notice: "User was successfully created." # redirect_to no transfer
    else
      # render partial: 'user_register_sf', layout: 'sf_label', locals: {title: 'Register error'} # partial not need _xxx
      render 'mains/welcome'
    end
  end

  def follow
    @user_id = session[:user_id]
    @firend = User.new(firend_params)
    @firend_id = @firend.id
    @user_relation = UserRelation.where(:user_id => @user_id, :firend_id => @firend_id).first
    if @user_relation.nil?
      @user_relation = UserRelation.new(:user_id => @user_id, :firend_id => @firend_id)
      @user_relation.relation = UserRelation::FOLLOW
      @user_relation.follow_time = Time.new
    else
      if @user_relation.relation == UserRelation::FOLLOW
        @user_relation.relation = UserRelation::NORMAL
        @user_relation.follow_time = NIL
      elsif @user_relation.relation == UserRelation::FIREND
        @user_relation.relation = UserRelation::FOLLOWED
        @user_relation.follow_time = Time.new
        @user_relation.follow_time = NIL
      elsif @user_relation.relation == UserRelation::FOLLOWED
        @user_relation.relation = UserRelation::FIREND
      else
        @user_relation.relation = UserRelation::FOLLOW
        @user_relation.follow_time = Time.new
      end
    end
    
    @firend_relation = UserRelation.where(:user_id => @firend_id, :firend_id => @user_id).first
    if @firend_relation.nil?
      @firend_relation = UserRelation.new(:user_id => @firend_id, :firend_id => @user_id)
      @firend_relation.relation = UserRelation::FOLLOWED
      @firend_relation.followed_time = Time.new
    else
      if @firend_relation.relation == UserRelation::FOLLOW
        @firend_relation.relation = UserRelation::FIREND
        @firend_relation.followed_time = Time.new
      elsif @firend_relation.relation == UserRelation::FOLLOWED
        @firend_relation.relation = UserRelation::NORMAL
        @firend_relation.followed_time = NIL
      elsif @firend_relation.relation == UserRelation::FIREND
        @firend_relation.relation = UserRelation::FOLLOW
        @firend_relation.followed_time = NIL
      else
        @firend_relation.relation = UserRelation::FOLLOWED
        @firend_relation.followed_time = Time.new
      end
    end
    
    if @user_relation.save && @firend_relation.save
      redirect_to mains_index_path
    end
    
  end

  def followers
    @user_relation = UserRelation.where(:firend_id => session[:user_id])
    if @user_relation.nil?
      
    else
      @user_relation.each do |ur|
        
      end
    end

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
      elsif User.authen_by_username(username, password)
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
  def params_new_user
    params.require(:user).permit(:username, :email, :form_password, :password_confirm);
  end
  # def user_params
  #   params.require(:user).permit(:username, :email, :form_password, :portrait_uri)
  # end
  def firend_params
    params.require(:user_relations).permit(:id)
  end

end
