class FollowingsController < ApplicationController
  before_filter :verify?
  
  def index
    @user = current_user
    @users = User.all
    @followed_users = @user.followed_users.map do |followed_user_record|
      id = followed_user_record.followed_user_id
      User.find(id)
    end
  end
  def create
    @user = current_user
    @following = Following.new(:followed_user_id => params[:user_id], :follower_id => @user.id)
    if @following.save!
      redirect_to followings_url
    else
      redirect_to followings_url
    end
  end
  
  def destroy
    @user = current_user
    @following = Following.where(:followed_user_id => params[:user_id], :follower_id => @user.id).first
    if @following.destroy
      redirect_to followings_url
    else
      redirect_to followings_url
    end
  end
  
end
