# frozen_string_literal: true

require 'test_helper'

class UserRoleChangeTest < ActionDispatch::IntegrationTest
  def setup
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end

  test 'form for admin appear and change role of user' do
    log_in_as(@admin)
    get user_path(@non_admin)
    assert_template 'users/show'
    assert_select 'p', text: 'User'
    assert_select 'h2', text: 'Update role for user'
    assert_select 'input.btn'
    patch roleupdate_path,
          params: { id: @non_admin.id,
                    user: { role: 'Moderator' } }
    follow_redirect!
    assert_select 'div.alert-success'
    assert_select 'p', text: 'Moderator'
  end

  test 'form for non_admin not appear' do
    log_in_as(@non_admin)
    get user_path(@admin)
    assert_template 'users/show'
    assert_select 'p', text: 'Admin'
    assert_select 'h2', text: 'Update role for user', count: 0
  end
end
