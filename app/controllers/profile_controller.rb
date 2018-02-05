class ProfileController < ApplicationController
def profilePage
	user_profile = User.find(session[:user_id]) 
	user_profile.name
	user_profile.email
	
	end
end

