class ForgotPasswordController < ApplicationController
  def new
  end

  def edit
    token =  SecureRandom.urlsafe_base64
    email = params[:email]
    user = User.find_by(email: email)
    return if user.nil?
    if user.update(reset_password_token: token, reset_password_sent_at: Time.now)
      UserMailer.reset_password(email, token).deliver_later
      render json: {'status': "ok"}
    else  
      render json: { error: 'Не удалось сбросить пароль' }, status: :unprocessable_entity
    end
  end
end