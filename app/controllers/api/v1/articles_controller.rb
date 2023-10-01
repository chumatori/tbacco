class Api::V1::ArticlesController < Api::ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    render json: article
  end

  def new
    @article = Article.new(permit_params)
    @article.user_id = @current_user.id
    if @article.save
      render json: @article
    else
      render json: { error: 'Несоздалось епт' }, status: :unprocessable_entity
    end
  end

  def update
    if article.user_id == @current_user.id && article.update!(permit_params)
      render json: article
    else
      render json: { error: 'Необновилось епт' }
    end
  end

  def destroy
    if  article.user_id == @current_user.id && article.destroy!
      render json: { ok: 'Deleted' }, status: :ok
    else
      render json: { error: 'Неудалилось епт' }, status: :unprocessable_entity
    end
  end

  private

  def article
    Article.find(params[:id]) 
  end

  def permit_params
    params.require(:article).permit(:header, :body)
  end
end