class ApplicationController < ActionController::Base
  helper_method :current_user

  private

# finds the current user based on the value for the user_id key in the session hash
# returns nil if user is not "logged in"
  def current_user
    User.find_by(id: session[:user_id])
  end

# returns true or false depending whether the session hash has a user_id key / value
  def logged_in?
    !!session[:user_id]
  end

# redirect to root if user isn't "logged in"
  def require_login
    redirect_to '/' unless logged_in?
  end

# redirect to ___ if user is "logged in"
  def require_logout
    # route tbd
    # redirect_to '/home' if logged_in?
  end
end
