class LoginController < ApplicationController
  def login
	@tweets = get_recent_tweets(10)
  end
  
  def auth
	@user = User.authenticate(params[:name], params[:pass])
	if(@user == nil)
		redirect_to login_url
	else 
		session[:user_id] = @user.id
		redirect_to home_url
	end
  
  end
  
  def register
  
  end
  
end
