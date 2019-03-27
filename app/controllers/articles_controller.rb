# frozen_string_literal: true

# TODO: Add desc
# desc here
class ArticlesController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy edit update]

  def index
    @article = current_user.articles.build if logged_in?
    @articles = Article.all.paginate(page: params[:page])
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = 'Article created!'
      redirect_to root_url
    else
      flash[:danger] = 'Article failed!'
      redirect_to '/articles'
    end
  end

  def edit; end

  def update; end

  def destroy; end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
