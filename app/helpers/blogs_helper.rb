module BlogsHelper

	def have_access(level = 0)
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

end
