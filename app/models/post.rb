class Post < ActiveRecord::Base
	belongs_to :user
  attr_accessible :post, :title
end
