class SessionsController < ApplicationController
# GET /login
  def new
  end

# POST /login
  def create

  end

# GET /auth/google_oauth2/callback
# separate login in for google oauth
  def omniauth
    binding.pry
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end

    session[:user_id] = @user.id

    # render 'welcome/home'
  end

# POST /logout
  def destroy

  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
