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
    @friend = current_user.friends.find_by(id: params[:id])

    if @friend
      @friend.update(friend_params)
      flash[:message] = "#{@friend.name}'s profile was updated"
    else
      flash[:message] = "invalid access"
    end

    redirect_to user_path(current_user)
  end

# DELETE /users/:user_id/friends/:id
  def destroy
    @friend = current_user.friends.find_by(id: params[:id])

    if @friend
      @friend.destroy
      flash[:message] = "friend deleted"
    else
      flash[:message] = "invalid access"
    end

    redirect_to user_path(current_user)
  end

  private

  def friend_params
    params.require(:friend).permit(:name, :email, :phone)
  end
end
