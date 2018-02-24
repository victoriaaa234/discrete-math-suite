class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    session[:user_image] = user.image
    puts(session[:user_profile])
    redirect_to request.env["omniauth.origin"]
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end