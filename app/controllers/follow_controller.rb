class FollowController < ApplicationController
	def add_follow
	   if current_user && params["user_id"] && !current_user.is_following(params["user_id"])
	           @fellow = User.find(params["user_id"])
		   if current_user.follow_assoc.create!(:following_id=>params["user_id"])
		    # render :json => {:'success' => true}
	            respond_to do |format|
		      format.js {render layout: false}
		    end
		   else 
		     render :json => {:'success' => false}
		   end
	   end
	end

	def un_follow
	  if current_user && params["user_id"] && current_user.is_following(params["user_id"])
	    @fellow = User.find(params["user_id"])
	    if current_user.un_follow(params["user_id"])
	      respond_to do |format|
		format.js {render layout:false}
	      end
	    end
	  end
	end
end
