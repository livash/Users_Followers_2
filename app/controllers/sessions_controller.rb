class SessionsController < ApplicationController
  
  def new
    render :login
  end
  
  def create
    @user = User.find_by_username(params[:user][:username])
    if @user.scrambled_password == scramble(params[:user][:password])
      @user.session_token = issue_session_token
      @user.save!
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      redirect_to new_session_url
    end
  end
  
  def destroy
    if verify?
      @user = current_user
      @user.session_token = nil
      @user.save
      session[:session_token] = nil
      render :logout
    else
      redirect_to new_session_url
    end
    
  end
  
end
