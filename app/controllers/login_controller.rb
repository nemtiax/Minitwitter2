class LoginController < ApplicationController
  def login
	@tweets = get_recent_tweets(10)
  end
  
  def logout 
	session.delete :user_id
	session.delete :user_name
	redirect_to login_url
  end
  
  def auth
	@user = User.authenticate(params[:name], params[:pass])
	if(@user == nil)
		redirect_to login_url
	else 
		session[:user_id] = @user.id
		session[:user_name] = @user.name
		redirect_to home_url
	end
  
  end
  
  def register
  
  end
  
end
