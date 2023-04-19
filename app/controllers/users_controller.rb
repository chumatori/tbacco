class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def lk
    @user_articles = Article.where(user_id: session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
