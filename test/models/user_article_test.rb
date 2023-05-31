require "test_helper"

class UserArticleTest < ActiveSupport::TestCase
  # Matchers
  should belong_to(:user)
  should belong_to(:article)

#   should validate_presence_of(:user_id)
#   should validate_presence_of(:article_id)
end