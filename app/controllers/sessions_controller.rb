class SessionsController < ApplicationController
# GET /login
  def new
  end

# POST /login
  def create

  end

# GET /auth/google_oauth2/callback
# log the user in if they authed in with Google before
# sign them up if not
# redirect to dashboard
  def omniauth
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(10)
    end

    session[:user_id] = @user.id
    # render 'welcome/home'
  end

# POST /logout
# logs the user out and redirects them to the root page
  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private
# helper method to make parsing omniauth response simpler
  def auth
    request.env['omniauth.auth']
  end
end
