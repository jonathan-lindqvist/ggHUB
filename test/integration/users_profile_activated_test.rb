# frozen_string_literal: true

require 'test_helper'

class UsersProfileActivatedTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  def teardown
    Rails.cache.clear
  end

  test 'only activated accounts show' do
    log_in_as(@user)

    4.times do |num|
      get "/users?page=#{num + 1}"
      assert_select 'a[href=?]', User.find_by(email: 'bosswhios@example.gov').id.to_s, count: 0
    end
  end

  test 'account not yet activated does not have a profile page' do
    log_in_as(@user)
    get "/users/#{User.find_by(email: 'bosswhios@example.gov').id}"
    assert_redirected_to users_url
  end
end
