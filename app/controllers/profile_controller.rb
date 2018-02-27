class ProfileController < ApplicationController
	def profilePage
		if params[:id] 
			@user = User.find(params[:id]) 
		else
			@user = current_user
		end
	end
end

