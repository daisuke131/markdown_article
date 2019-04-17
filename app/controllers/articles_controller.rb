class ArticlesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_article, only: [:update, :destroy]

  def index
    @articles = Article.published.left_joins(:user).select("articles.*, users.id as user_id, users.username").order("created_at desc")
  end

  def show
    @article =
      if current_user.id == params[:id]

        current_user.articles.left_joins(:user).select("articles.*, users.username").find(params[:id])
      else
        Article.published.left_joins(:user).select("articles.*, users.username").find(params[:id])
      end
  end

  def new
    @article = Article.new
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def create
    current_user.articles.create!(article_params)
    redirect_to root_path
  end

  def update
    @article.update!(article_params)
    redirect_to root_path
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
