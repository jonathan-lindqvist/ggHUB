require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @journalist = users(:bob)
    @journalist2 = User.new(name: 'Example User', email: 'tester@example.com',
                            password: 'foobar', password_confirmation: 'foobar', role: 'journalist')
    @article = @journalist.articles.build(title: 'test title', content: 'Lorem ipsum')
  end

  test 'should be valid' do
    assert @article.valid?
  end

  test 'user id should be present' do
    @article.user_id = nil
    assert_not @article.valid?
  end

  test 'order should be most recent first' do
    assert_equal articles(:most_recent), Article.first
  end

  test 'associated articles should be destroyed' do
    @journalist2.save
    @journalist2.articles.create!(title: 'reee', content: 'Lorem ipsum')
    assert_difference 'Article.count', -1 do
      @journalist2.destroy
    end
  end
end
