class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  
  has_many :posts

  has_many :follow_assoc, class_name: "Follow", foreign_key: "user_id" 
  has_many :follows , through: :follow_assoc, :source=> :follows

  has_many :followers_assoc, class_name: "Follow", foreign_key: "following_id"
  has_many :followers, through: :followers_assoc, :source=>:followers

  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
