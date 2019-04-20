class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :delete]
  before_action :set_article, only: [:update, :destroy]

  def index
    @articles = Article.published.left_joins(:user).select("articles.*, users.id as user_id, users.username").order("created_at desc")
  end

  def show
    @article = Article.published.left_joins(:user).select("articles.*, users.id as user_id, users.username").find(params[:id])
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

  def destroy
    @article.destroy!
    redirect_to root_path
  end

  private

    def set_article
      @article = current_user.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
