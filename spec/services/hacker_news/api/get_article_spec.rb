require 'rails_helper'

describe HackerNews::Api::GetArticle do
  describe '#initialize' do
    it 'should require an id to initialize' do
      expect { HackerNews::Api::GetArticle.new }.to raise_error(ArgumentError)
      expect { HackerNews::Api::GetArticle.new(1) }.not_to raise_error
    end
  end

  describe '#call' do
    it 'should return nil if an invalid id is provided' do
      expect(HackerNews::Api::GetArticle.(0)).to eq(nil)
    end
    it 'should return a hash if a valid id is provided' do
      expect(HackerNews::Api::GetArticle.(1)).to be_a(Hash)
    end
  end

  describe '#article_url' do
    it 'should combine the BASE_URL, ARTICLE_PATH, and id parameter' do
      get_article = HackerNews::Api::GetArticle.new(1)
      expect(get_article.send(:article_url)).to eq("https://hacker-news.firebaseio.com/v0/item/1.json")
    end
  end

  describe '#parse_response' do
    it 'should return nil if the request is not successful' do
      get_article = HackerNews::Api::GetArticle.new(0)
      get_article.send(:get_article)
      # article_hash = get_article.send(:parse_response)
      expect(get_article.send(:parse_response)).to be nil
    end
    it 'should return a hash if the request is successful' do
      get_article = HackerNews::Api::GetArticle.new(1)
      get_article.send(:get_article)
      expect(get_article.send(:parse_response)).to be_a Hash
    end
  end

end
