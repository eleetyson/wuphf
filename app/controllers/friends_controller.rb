class FriendsController < ApplicationController
  before_action :require_login
  layout "dashboard"

# GET /users/:user_id/friends/:id/
# redirects to edit form displaying the given friend's profile
  def show
    redirect_to edit_user_friend_path(current_user, params[:id])
  end

# GET /users/:id/friends/new
# new_user_friend_path(current_user)
  def new
    @friend = Friend.new
  end

# POST /users/:id/friends
# params[:friend][:name], params[:friend][:email], params[:friend][:phone]
  def create
    @message = Message.new(content: "test", user_id: current_user.id)
    @friend = Friend.new(friend_params)
    @message.friend = @friend

    if @friend.save && @message.save
      flash[:message] = "#{@friend.name}'s profile was created"
      redirect_to user_path(current_user)
    else
      flash[:message] = @friend.errors.full_messages.first || @message.errors.full_messages.first
      redirect_to new_user_friend_path(current_user)
    end
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
