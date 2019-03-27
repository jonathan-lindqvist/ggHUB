# frozen_string_literal: true

# TODO: Add desc
# desc here
class ArticlesController < ApplicationController
  def index
    @articles = Article.all.paginate(page: params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end
end
