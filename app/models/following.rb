class Following < ActiveRecord::Base
  attr_accessible :follower_id, :followed_user_id
  
  validates :follower_id, :followed_user_id, :presence => true,
  :numericality => true
  
  belongs_to :follower,
  :class_name => "User",
  :foreign_key => :followed_user_id
  
  belongs_to :followed_user,
  :class_name => "User",
  :foreign_key => :follower_id
end
