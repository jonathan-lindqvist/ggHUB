# frozen_string_literal: true

require 'test_helper'

class UserArticlesTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
    @non_admin = users(:archer)
  end

  test 'for user with premissions profile display' do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'a[href=?]', "/users/#{@user.id}/articles", text: "View #{@user.name} articles"
  end

  test 'for user without role profile display' do
    log_in_as(@non_admin)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'a[href=?]', "/users/#{@user.id}/articles", text: "View #{@user.name} articles"
  end

  test 'for user without articles profile display' do
    log_in_as(@user)
    get user_path(@non_admin)
    assert_template 'users/show'
    assert_select 'title', full_title(@non_admin.name)
    assert_select 'a[href=?]', "/users/#{@non_admin.id}/articles", text: "View #{@non_admin.name} articles", count: 0
  end

  test 'user article page' do
    log_in_as(@user)
    get "/users/#{@user.id}/articles"
    assert_template 'show_articles'
    assert_select 'img', count: 1
  end

  test 'index articles' do
    get '/'
    assert_template '/'
    assert_select 'div.jumbotron', count: 5
  end

  test 'news page' do
    get '/articles'
    assert_template 'articles/index'
    assert_select 'ul.pagination', count: 2
    assert_select 'h1.display-4'
    assert_select 'p.lead'
  end

  test 'show article' do
    get "/articles/#{@user.articles[0].id}"
    assert_template 'articles/show'
    assert_select "h2##{@user.articles[0].id}"
  end
end
