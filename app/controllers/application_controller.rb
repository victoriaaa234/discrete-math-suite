class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  before_action :set_last_seen_at, if: proc { !current_user.nil? }

  def set_last_seen_at
    current_user.update_attribute(:last_seen, Time.zone.now)
  end


end