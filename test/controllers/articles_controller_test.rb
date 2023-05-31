require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = FactoryBot.create(:article)
  end

  test "should get index" do
    get articles_path
    assert_response :success
  end

  test "should get liked articles" do
    get liked_articles_path
    assert_response :success
  end

  test "should show organization" do
    get article_path(@article.article_id)
    assert_response :success
  end

end