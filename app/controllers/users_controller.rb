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
end
