class LoginController < ApplicationController
  def login
  end
  
  def auth
	@user = User.where(name: params[:name], password: params[:pass]).first
	if(@user == nil)
		redirect_to login_url
	else 
		session[:user_id] = @user.id
		redirect_to home_url
	end
  
  end
  
end