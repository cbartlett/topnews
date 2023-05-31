require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Matchers
  should have_many(:user_articles)
  should have_many(:articles).through(:user_articles)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:password)
end
