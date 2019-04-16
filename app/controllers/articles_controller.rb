class ArticlesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_article, only: [:update, :destroy]

  def index
    @articles = Article.published.left_joins(:user).select("articles.*, users.username").order("created_at desc")
  end

  def show
    @article =
      if current_user
        current_user.articles.published.left_joins(:user).select("articles.*, users.username").find(params[:id])
      else
        Article.published.left_joins(:user).select("articles.*, users.username").find(params[:id])
      end
    end
  end

  def create
    current_user.articles.create!(article_params)
  end

  def update
    @article.update!(article_params)
  end

  def delete
    @article.destroy!
  end

  private
  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
