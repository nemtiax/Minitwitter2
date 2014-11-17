class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  
	

	def get_followed_tweets(user, num_results)
		followed_tweets = []
		user.followees.each do |followee|
			followed_tweets << followee.tweets.order(:created_at).reverse.first(num_results)
		end
		followed_tweets.flatten!
		followed_tweets.sort_by! { |tweet| tweet.created_at }
		followed_tweets.reverse.first(num_results)
	end
	
	def get_recent_tweets(num_results)
		Tweet.all.order(:created_at).reverse.first(num_results)
	end

  
end
