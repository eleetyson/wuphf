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
# params[:friend][:name], params[:friend][:email], params[:friend][:phone]
  def create
    #something

    # if it saves
      # do this
    # else
      # do that
      # flash[:message] = @user.errors.full_messages.first
      # redirect_to new_user_friend_path(current_user)
    # end
  end

# GET /users/:user_id/friends/:id/edit
# edit_user_friend_path(current_user, the friend)
  def edit
    @friend = current_user.friends.find_by(id: params[:id])
  end

# PATCH /users/:user_id/friends/:id
# user_friend_path(current_user, the friend)
  def update
    # something

    # if it saves
      # do this
    # else
      # do that
      # flash[:message] = @user.errors.full_messages.first
      # redirect_to edit_user_friend_path(current_user, the friend)
    # end
  end

# DELETE /users/:user_id/friends/:id
  def destroy
    # double check that user is authorized to delete the given friend

    # if deleting works...
      # do this
    # else
      # do that
      # redirect_to user_path(current_user)
    # end
  end

  private

  def friend_params
    params.require(:friend).permit(:name, :email, :phone)
  end
end
