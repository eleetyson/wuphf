class MessagesController < ApplicationController
  before_action :require_login

# POST /messages
  def create
    if params[:email] # message creation for user sending first WUPHF
      @message = Message.new(content: params[:content], user_id: current_user.id)
      @friend = @message.build_friend(name: params[:name], email: params[:email], phone: params[:phone])

      if @friend.save && @message.save
        # send it
      else
        flash[:message] = @friend.errors.full_messages.first || @message.errors.full_messages.first
        redirect_to user_path(current_user)
      end

    else # message creation with existing recipient selection
      @message = Message.new(content: params[:message][:content], user_id: current_user.id)
      @friend = current_user.friends.find_by(id: params[:message][:friend_id])

      if @friend
        @message.friend = @friend
        @message.save
        # send it
        # @message.send_wuphf
      else
        flash[:message] = "invalid recipient"
        redirect_to user_path(current_user)
      end
    end

  end

end
