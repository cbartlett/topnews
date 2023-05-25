FactoryBot.define do
    factory :user_article do
      association :user
      association :article
    end
  end
  