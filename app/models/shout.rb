class Shout < ActiveRecord::Base
  attr_accessible :message,
  belongs_to :user
  has_many :likes
  has_many :liking_users, :through => :likes, :source=>:user

  validates :message, :uniqueness => true
  validates :message, :presence => true
  
end
