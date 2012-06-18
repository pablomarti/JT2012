class LoginController < ApplicationController

  def index
  	if session[:user_level] != 0
  		redirect_to admins_path
  		return
  	end

    @message = ""
    if !params[:message].nil?
      @message = params[:message] 
    end
  end

  def auth
  	admin = Admin.login(params[:email], params[:password])
  	if admin != 0
      session[:user_level] = admin
  		redirect_to admins_path
  		return
  	else
  		redirect_to login_path("Invalid user or password")
  		return
  	end
  end

  def logout
  	session[:user_level] = 0
  	redirect_to init_path
  end

end
