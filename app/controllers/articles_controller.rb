class ArticlesController < ApplicationController
  def index
    @articles = Article.where(banned_at: nil)
  end

  def show
    @article = Article.find_by(id: params[:id])
    redirect_to articles_path if @article&.banned?
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
    redirect_to articles_path if @article&.banned?
  end
  
  def update
    @article = Article.find(params[:id])
    redirect_to articles_path if @article&.banned?

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

  def like
    pp "dfssdfsdfsdfsd"
    pp current_user
    Reaction.where(user: current_user, article_id: params[:id], kind: 'like').first_or_create
    Reaction.find_by(user: current_user, article_id: params[:id], kind: 'dislike')&.destroy!
  end

  def dislike
    Reaction.where(user: current_user, article_id: params[:id], kind: 'dislike').first_or_create
    Reaction.find_by(user: current_user, article_id: params[:id], kind: 'like')&.destroy!
  end

  private
  def article_params
    params.require(:article).permit(:header, :body)
  end
end
