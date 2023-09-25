class ResetPasswordController < ApplicationController
  def new
    render json: {"status": 'error'} unless check_params
    @email = params[:email]
    @token = params[:token]
  end
  
  def update
    render json: {"status": 'error'} unless check_params
    User.find_by(email: params[:email]).update(password: params[:password])
  end

  def check_params
    user = User.find_by(email: params[:email])
    !user.nil? && user.reset_password_token == params[:token]
  end
end