class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :verify_user
  before_filter :set_user_language
  before_filter :use_remote

  def verify_user
  	if session[:user_level].nil?
  		session[:user_level] = 0
  	end
  end

  def can_access(level = 0)
  	if level == 0
  		return session[:user_level] > 0
  	else
  		if level == session[:user_level] || session[:user_level] == 1
  			return true
  		else
  			return false
  		end
  	end
  end

  def set_user_language
    if session[:lang].nil?
      session[:lang] = "es"
    end
    I18n.locale = session[:lang]
  end

  def use_remote
    session[:remote] = true
    if !session[:user_level].nil? && session[:user_level].to_i > 0
      session[:remote] = false
    end
  end

end
