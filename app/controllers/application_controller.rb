class ApplicationController < ActionController::Base
  helper_method :current_user

  private
# finds the current user based on the value for the user_id key in the session hash
# returns nil if user is not "logged in"
  def current_user
    User.find_by(id: session[:user_id])
  end

# returns true or false depending on whether the session hash has a user_id key / value
  def logged_in?
    !!session[:user_id]
  end

# redirects to root if user isn't "logged in"
  def require_login
    redirect_to root_path unless logged_in?
  end

# redirects to dashboard if user is "logged in"
  def require_logout
    redirect_to user_path(current_user) if logged_in?
  end
end
