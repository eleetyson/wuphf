class UserMailer < ApplicationMailer
# sends the email for each WUPHF
  def wuphf_email(message)
    @message = message
    mail(to: @message.friend.email.strip, subject: "WUPHF from #{@message.user.name}")
  end
end
