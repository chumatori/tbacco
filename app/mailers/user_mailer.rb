class UserMailer < ApplicationMailer
  default from: 'lemontiler@gmail.com'

  def recovery_password(user)
    mail(to: user, subject: 'Password recovery').deliver_later
  end

end
