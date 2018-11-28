class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def auth_req
    if !logged_in?
      return false
      #also return error methods
    end
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
    @current_user || User.find_by(id: session[:user_id])
  end

end
