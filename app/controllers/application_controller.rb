class ApplicationController < ActionController::Base
  helper_method :logged_in?
  before_action :authenticate_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    if !logged_in?
      redirect_to login_path
    end
  end

  def already_logged_in
    if logged_in?
      redirect_to user_path(current_user.id)
    end
  end

end
