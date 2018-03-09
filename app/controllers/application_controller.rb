class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
  end

  before_action :set_last_seen_at, if: proc { !current_user.nil? }

  def set_last_seen_at
    current_user.update_attribute(:last_seen, Time.zone.now)
    if(current_user.email=="pcr@tamu.edu")
      current_user.update_attribute(:admin, true)
    end
  end

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, notice: "Admin only"
  end

end