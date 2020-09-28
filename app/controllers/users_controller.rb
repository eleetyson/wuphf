class UsersController < ApplicationController
# root
  def home
  end
  
# GET /users
  def new
    @user = User.new
  end

# POST /users
  def create

  end

# GET /auth/google_oauth2/callback
# separate login in for google oauth
  def omniauth

  end
end
