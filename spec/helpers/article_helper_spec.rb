require 'rails_helper'

RSpec.describe ArticleHelper, type: :helper do
  let(:user1) { 
    User.create(first_name: 'John', last_name: "Doe", email: "a@b.co", password: 'password')
  }
  let(:user2) { 
    User.create(first_name: 'Jane', last_name: "Doe", email: "b@c.do", password: 'password')
  }
  let(:article) {
    Article.create(external_id: 1, by: "Jane Doe", time: Time.at(1), title: "Test Article", url: 'https://www.example.com', kind: 'story', data: { foo: :bar })
  }

  describe "#star_classes" do
    it "should return 'article__star' if there is no join between current_user and the article" do
      expect(helper.star_classes(article, user1)).to eq('article__star')
    end
    it "should return 'article__star article__star--selected' if there is a join" do
      UsersArticle.create(user: user1, article: article)
      expect(helper.star_classes(article, user1)).to eq('article__star article__star--selected')
    end
  end
  describe "#article_liked_by" do
    it "should return a blank string if there is no join" do
      expect(helper.article_liked_by(article)).to eq('')
    end
    it "should return a joined user names if there are joins" do
      UsersArticle.create(user: user1, article: article)
      UsersArticle.create(user: user2, article: article)
      expect(helper.article_liked_by(article)).to eq("John Doe and Jane Doe")
    end
  end
end
