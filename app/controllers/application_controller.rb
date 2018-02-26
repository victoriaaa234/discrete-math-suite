require 'pry'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
	# binding.pry
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
  end
<<<<<<< HEAD
end
=======

  before_action :set_last_seen_at, if: proc { !current_user.nil? }

  def set_last_seen_at
    current_user.update_attribute(:last_seen, Time.zone.now)
  end


end
>>>>>>> induction
