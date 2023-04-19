class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    redirect_to root_path if !authorize?
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article[:user_id] = current_user.id
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    redirect_to root_path if !authorize?
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to lk_path
    else
      render :delete, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:header, :body)
  end
end
