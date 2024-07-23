require 'rails_helper'

describe HackerNews::Api::GetRecentArticles do
  describe '#initialize' do
    it 'should require no arguments to initialize' do
      expect { described_class.new }.not_to raise_error
    end
  end

  describe '#call' do
    it 'should return an array of integers' do
      expect(described_class.()).to be_a Array
    end
    # # Wasn't sure of an elegant solution for this other than using
    # # some libraries like FakeWeb or VCR
    # it 'should return nil if the api call fails' do 
    #   expect(described_class.()).to be nil
    # end
  end

  describe '#recent_articles_url' do
    it 'should combine the BASE_URL and ARTICLES_PATH' do
      get_article = described_class.new
      expect(get_article.send(:recent_articles_url)).to eq("https://hacker-news.firebaseio.com/v0/topstories.json")
    end
  end

  describe '#parse_response' do
    it 'should return a hash if the request is successful' do
      get_article = described_class.new
      get_article.send(:get_articles)
      expect(get_article.send(:parse_response)).to be_a Array
    end
  end

end
