class HomeController < ApplicationController
	def index
	  follows = current_user.follows.map(&:id)	
	  arr = [current_user.id]
	  unless follows.blank?
		arr += follows
	  end

	  @feed = Post.joins("join follows on posts.user_id=follows.following_id").where("follows.user_id=#{current_user.id}").includes(:user)

	  @fellows = User.where("id  not in (#{arr.join(",")}) ")
	  @followings = current_user.follows
	end
end
