class Message < ApplicationRecord
  belongs_to :user
  belongs_to :friend
  validates :content, presence: true

# triggers the text message and email delivery
  def send_wuphf
    self.deliver_text_message
    self.deliver_email
  end

# sends the text message using Twilio's API
  def deliver_text_message
    account_sid = ENV['TWILIO_ID']
    auth_token = ENV['TWILIO_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+14782490442'
    to = "+1" + self.friend.phone
    body = "WUPHF from #{self.friend.name}:\n\n" + self.content
    client.messages.create(from: from, to: to, body: body)
  end

# calling the #send_wuphf method on the UserMailer class to send the email
  def deliver_email
    UserMailer.wuphf_email(self).deliver_now
  end
end
