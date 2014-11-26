class LoginController < ApplicationController

  
  def auth
	@user = User.where(name: params[:name], password: params[:pass]).first
	if(@user == nil)
		redirect_to login_url
	else 
		session[:user_id] = @user.id
		redirect_to home_url
	end
  
  end
  
  def create
  
  end
  
  def register
	begin
		User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
	rescue
		redirect_to register_url, :flash => {:notice => "Registration failed!"}
	else
		redirect_to home_url, :flash => {:notice => "Registration successful!"}
	end
  end
  
end
