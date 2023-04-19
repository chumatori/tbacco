class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_articles
  helper_method :authorize?

  def current_user
    @current_user ||= User.find_by({id: session[:user_id]}) if session[:user_id]
  end

  def user_articles
    @current_articles = Article.where(user_id: session[:user_id]) if session[:user_id]
  end

  def authorize?
    session[:user_id]
  end
end
