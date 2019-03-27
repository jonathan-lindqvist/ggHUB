class ArticlesController < ApplicationController
  def index
    @articles = Article.all.paginate(page: params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end
end
