class MessagesController < ApplicationController
  before_action :require_login

# POST /messages
# to add logic handling input from form for new friend
# or simpler input from form for msg to existing friend
  def create
    if params[:message][:friend][:name]
      "this"
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
