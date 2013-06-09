require 'securerandom'

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def verify?
    if current_user
      current_user.session_token == session[:session_token]
    else
      false
    end
  end
  
  def issue_session_token
    SecureRandom.base64(32)
  end
  
  def scramble(password)
    password
  end
  
  def current_user
    if session[:session_token]
      User.find_by_session_token(session[:session_token])
    else
      nil
    end
  end
end
