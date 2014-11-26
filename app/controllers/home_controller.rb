class RootController < ApplicationController
	def show
		@tweets = get_recent_tweets(10)
	end
end
