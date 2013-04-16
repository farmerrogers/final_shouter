class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :username
    has_many :shouts
  has_many :likes
  has_many :liked_shouts, :through => :likes, :source => :shout
  
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :inclusion => { :in => %w(@),     #copied from rails guides example on line 20
  	:message => "%{value} is not a valid email address." }		#is there anything else I need to do?
  
  #  validates :size, :inclusion => { :in => %w(small medium large),
  #  :message => "%{value} is not a valid size" }

  
end
