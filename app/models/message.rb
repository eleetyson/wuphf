class Message < ApplicationRecord
  belongs_to :user
  belongs_to :friend
  validates :content, presence: true

  private

  def send_wuphf
    self.deliver_text_message
    self.deliver_email
  end

  def deliver_text_message
    account_sid = "#{ENV['ACCOUNT_SID']}"
    auth_token = "#{ENV['AUTH_TOKEN']}"
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+14782490442'
    to = "+1" + self.friend.phone
    body = "WUPHF from #{self.friend.name}:\n\n" + self.content
    client.messages.create(from: from, to: to, body: body)
  end

  def deliver_email

  end
end
