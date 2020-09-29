class SessionsController < ApplicationController
# GET /login
  def new
  end

# POST /login
# log the user in if given valid credentials
# redirect to the login page with flash message if not
  def create
    user = User.find_by(email: params[:email])
    user = user.try(:authenticate, params[:password])

    if user
      session[:user_id] = user.id
      @user = user
      redirect_to user_path(@user)
    else
      flash[:message] = "invalid login credentials"
      redirect_to login_path
    end
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
    redirect_to user_path(@user)
  end

# POST /logout
# logs the user out and redirects them to the root page
  def destroy
    session.clear
    redirect_to root_path
  end

  private
# helper method to make parsing omniauth response simpler
  def auth
    request.env['omniauth.auth']
  end
end
