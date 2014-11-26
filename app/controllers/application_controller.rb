class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  
	

	def get_followed_tweets(user, num_results)
		user.followed_tweets.order(:created_at).reverse.first(num_results)
		
	end
	
	def get_recent_tweets(num_results)
		Tweet.all.order(:created_at).reverse.first(num_results)
	end

  
end
