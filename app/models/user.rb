class User < ActiveRecord::Base
	has_many :tweets
	has_many :followers, class_name: "Follower", foreign_key: "followee"
	has_many :followees, class_name: "Follower", foreign_key: "follower"
end
