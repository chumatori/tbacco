class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @articles = Article.find(params[:id])
  end

  def create
  end
  def new
  end
  def edit
  end
  def destroy
  end
end
