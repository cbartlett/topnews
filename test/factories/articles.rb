FactoryBot.define do
    factory :article do
      title { "How to Make it Big" }
      author { "John Doe" }
      score { 12345 }
      url { "nytimes.com" }
      article_id { 8863 }
    end
  end
  