class Follow < ActiveRecord::Base
	belongs_to :follows, :class_name=>"User", foreign_key: "following_id"
	belongs_to :followers, :class_name=>"User", foreign_key: "user_id"

	attr_accessible :following_id
  # attr_accessible :title, :body
end
