class UserMailer < ApplicationMailer
# method responsible for actually sending the email
  def wuphf_email(message)
    @message = message
    mail(to: @message.friend.email.strip, subject: "WUPHF from #{@message.user.name}")
  end
end
