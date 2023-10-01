class Api::ApplicationController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate
  def authenticate
    token = request.headers['Authorization']&.split(' ')&.last
    if token && Jwt.decode(token)
      @current_user = User.find(Jwt.decode(token)[:user_id])
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end