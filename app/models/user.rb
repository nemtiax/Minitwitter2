class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
	has_many :tweets
	has_many :follower_connections, :foreign_key => :follower_id, :dependent => :destroy
	has_many :followees, :class_name => "User", :through => :follower_connections, :source => :followee
	has_many :followed_tweets, :class_name => "Tweet", :through => :followees, :source => :tweets
	has_many :reverse_follower_connections, :class_name => "FollowerConnection", :foreign_key => :followee_id, :dependent => :destroy
	has_many :followers, :class_name => "User", :through => :reverse_follower_connections, :source => :follower
end
