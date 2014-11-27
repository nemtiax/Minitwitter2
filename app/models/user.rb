require 'digest'
class User < ActiveRecord::Base
	has_many :tweets
	has_many :follower_connections, :foreign_key => :follower_id, :dependent => :destroy
	has_many :followees, :class_name => "User", :through => :follower_connections, :source => :followee
	has_many :reverse_follower_connections, :class_name => "FollowerConnection", :foreign_key => :followee_id, :dependent => :destroy
	has_many :followers, :class_name => "User", :through => :reverse_follower_connections, :source => :follower
	
 # VIRTUAL ATTRIBUTES
  def password
   nil
  end

  def password=(my_password)
    
	self.hashed_password = Digest::MD5.hexdigest(my_password)
  end
	
end
