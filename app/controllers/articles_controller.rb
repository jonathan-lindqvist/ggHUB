# frozen_string_literal: true

# TODO: Add desc
# desc here
class ArticlesController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy edit update new]
  before_action :correct_user,   only: %i[destroy edit update]
  before_action :allowed_user,   only: %i[destroy destroy edit update]

  def index
    @article = current_user.articles.build if logged_in?
    @articles = Article.all.paginate(page: params[:page])
  end

  def new
    @article = Article.new
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

  def update
    # rubocop:disable Rails/ActiveRecordAliases
    if @article.update_attributes(article_params)
      flash[:success] = 'Article updated'
      redirect_to @article
    else
      render 'edit'
    end
    # rubocop:enable Rails/ActiveRecordAliases
  end

  def destroy
    @article.destroy
    flash[:success] = 'Article deleted'
    redirect_to request.referer || root_url
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to root_url if @article.nil?
  end

  def allowed_user
    redirect_to(root_url) unless current_user.role == 'Admin' || current_user.role == 'Journalist' || current_user.role == 'Moderator'
  end
end
