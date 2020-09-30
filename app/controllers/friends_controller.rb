class FriendsController < ApplicationController
  before_action :require_login
  layout "dashboard"

  def index
  end

# GET /users/:id/friends/new
# new_user_friend_path(current_user)
  def new
    @friend = Friend.new
  end

# POST /users/:id/friends
  def create
    
  end

# GET /users/:user_id/friends/:id/edit
# edit_user_friend_path(current_user, the friend)
  def edit
  end

# PATCH /users/:user_id/friends/:id
# user_friend_path(current_user, the friend)
  def update
  end

  private

  def friend_params

  end
end
