require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # Matchers
  should have_many(:user_articles)
  should have_many(:users).through(:user_articles)

  should validate_presence_of(:title)
  should validate_presence_of(:author)
  should validate_presence_of(:score)
  should validate_presence_of(:url)

  should validate_numericality_of(:score)

  # Context
  context "Given context" do
    setup do 
      create_articles
      create_users
      create_user_articles
    end

    should "list articles alphabetically" do
      assert_equal [@nytimes, @washington_post, @time], Article.alphabetical
    end

    should "list liked articles" do
      assert_equal 2, Article.has_likes.count
      assert_equal [@nytimes, @washington_post], Article.has_likes.alphabetical
    end
  end
end
