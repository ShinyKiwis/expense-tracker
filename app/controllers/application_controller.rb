class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    session[:current_user_id] && User.find(session[:current_user_id])
  end
end
