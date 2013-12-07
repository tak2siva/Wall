class HomeController < ApplicationController
	def index
	  follows = current_user.follows.map(&:id)	
	  arr = [current_user.id]
	  unless follows.blank?
		arr += follows
	  end

	  @editable = true
	  if params[:user_id].blank?
	    @feed = Post.joins("join follows on posts.user_id=follows.following_id").where("follows.user_id=#{current_user.id}").includes(:user)
	    @followings = current_user.follows
	  else
	    @editable = false
	    @feed = User.find(params["user_id"]).posts
	    @followings = User.find(params["user_id"]).follows
	  end

	  @fellows = User.where("id  not in (#{arr.join(",")}) ")
	end
end
