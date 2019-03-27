class ApplicationController < ActionController::Base
  helper_method :logged_in?
  before_action :authenticate_user, except: [:index]

  def index
    render 'home/index.html.erb'
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    if !logged_in?
      redirect_to new_user_path
    end
  end

  def already_logged_in
    if logged_in?
      redirect_to user_path(current_user.id)
    end
  end

end
