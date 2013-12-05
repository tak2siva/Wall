class HomeController < ApplicationController
	def index
	  @fellows = User.where("id != #{current_user.id}")
	end
end
