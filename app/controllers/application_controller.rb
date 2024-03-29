class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    else
      nil
    end
end
end
