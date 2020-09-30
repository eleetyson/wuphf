class MessagesController < ApplicationController
  before_action :require_login

# POST /messages
# to add logic handling input from form for new friend
# or simpler input from form for msg to existing friend

# message[content]
# message[friend][name]
# message[friend][email]
# message[friend][phone]
  def create
    if params[:message][:friend]
      @message = Message.new(content: params[:message][:content])
      @message.user = current_user
      f = Friend.new(name: params[:message][:friend][:name], email: params[:message][:friend][:email], phone: params[:message][:friend][:phone])
      if f.save
        @message.friend = f
      else
        "ds"
        # error message
      end
    else
      @message = Message.new(message_params)
    end
  end

  private
# to add params that go level deeper from new friend
  def message_params
    params.require(:message).permit(:friend_id, :content)
  end
end
