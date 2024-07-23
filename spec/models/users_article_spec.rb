require 'rails_helper'

RSpec.describe UsersArticle, type: :model do
  let(:user) do
    User.create(first_name: "John", last_name: "Doe", email: "a@b.co", password: "password")
  end
  let(:article) do
    Article.create(external_id: 1, by: "Jane Doe", time: Time.at(1), title: "Test Article", url: 'https://www.example.com', kind: 'story', data: { foo: :bar })
  end
  context "validations" do
    it 'should validate uniqueness users scoped to articles' do
      users_article1 = UsersArticle.create(user: user, article: article)
      users_article2 = UsersArticle.new(user: user, article: article)

      expect(users_article1.persisted?).to be true
      expect { users_article2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
