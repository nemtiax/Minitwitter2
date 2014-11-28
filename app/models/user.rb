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
    
	self.hashed_password = hashPassword(my_password)
  end
  
  def self.authenticate(auth_name, auth_password) 
	User.where(name: auth_name, hashed_password: hashPassword(auth_password)).first
  end
  
  def self.hashPassword(password) 
	Digest::MD5.hexdigest(password)
  end
	
end
