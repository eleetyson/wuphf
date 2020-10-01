class MessagesController < ApplicationController
  before_action :require_login

# POST /messages
  def create
    if params[:email] # message creation for user sending first WUPHF
      @message = Message.new(content: params[:content], user_id: current_user.id)
      @friend = @message.build_friend(name: params[:name], email: params[:email], phone: params[:phone])

      if @friend.save && @message.save # send the WUPHF if given valid input
        @message.send_wuphf
        flash[:message] = "WUPHF sent :)"
      else
        flash[:message] = @friend.errors.full_messages.first || @message.errors.full_messages.first
      end

    else # message creation with existing recipient selection
      @message = Message.new(content: params[:message][:content], user_id: current_user.id)
      @friend = current_user.friends.find_by(id: params[:message][:friend_id])

      if @friend # send the WUPHF if selected friend is valid
        @message.friend = @friend
        @message.save
        @message.send_wuphf
        flash[:message] = "WUPHF sent ⚡"
      else
        flash[:message] = "invalid recipient"
      end

    end # end if params[:email] / else
    redirect_to user_path(current_user)
  end # end create action

end
