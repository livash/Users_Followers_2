class UsersController < ApplicationController
  before_filter :verify?, :except => :new
  
  def new
    @user = User.new
  end
  def create
    @user = User.new(:name => params[:user][:name], :username => params[:user][:username])
    @user.scrambled_password = scramble(params[:user][:password])
    if @user.save!
      @user.session_token = issue_session_token
      @user.save!
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      redirect_to new_user_url(@user)
    end
  end
  def show
    @user = current_user
    @followers = @user.followers.map do |follower_record|
      id = follower_record.follower_id
      User.find(id)
    end
    @followed_users = @user.followed_users.map do |followed_record|
      id = followed_record.followed_user_id
      User.find(id)
    end
    
  end
end
