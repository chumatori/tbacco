class UserMailer < ApplicationMailer
  default from: 'lemontiler@gmail.com'
  default_url_options[:host] = "localhost:3000"
  def reset_password(email, token)
    params= {email: email, token: token}
    @url = url_for(controller: 'reset_password', action: 'new', only_path: false, params: params)
    mail(to: email, subject: 'Password reset')
  end
end
