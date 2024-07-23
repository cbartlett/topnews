require 'rails_helper'

describe HackerNews::Articles::Store do
  let(:valid_api_response) {
    { 
      'id' => 1,
      'time' => 1,
      'by' => 'JohnnyDoe',
      'url' => 'https://www.example.com',
      'title' => 'My Title',
      'type' => 'story' 
    }
  }
  describe '#initialize' do
    it 'should require a hash to initialize' do
      expect { described_class.new }.to raise_error(ArgumentError)
      expect { described_class.new({}) }.to_not raise_error
    end
  end

  describe '#call' do
    it 'should return nil if the hash argument is invalid' do
      expect(described_class.({})).to eq nil
    end
    it 'should return a new Article if the article is new' do
      article = described_class.(valid_api_response)
      expect(article.class).to be Article
      expect(article.persisted?).to eq true
    end
    it 'should return an existing and updated Article if the article is not new' do
      article = described_class.(valid_api_response)
      new_data = valid_api_response.tap {|h| h['title'] = 'New Title' }
      article2 = described_class.(new_data)
      expect(article.id).to eq article2.id
      expect(article2.title).to eq 'New Title'
    end
  end

  describe 'data_invalid?' do
    it 'should be valid if it has the required keys: id, time, by, url, title, and type' do
      store = described_class.new(valid_api_response)
      expect(store.send(:data_invalid?)).to eq false
    end
    it 'should be invalid if it is missing any required key' do
      store = described_class.new(valid_api_response.except('id'))
      expect(store.send(:data_invalid?)).to eq true
      store = described_class.new(valid_api_response.except('time'))
      expect(store.send(:data_invalid?)).to eq true
      store = described_class.new(valid_api_response.except('by'))
      expect(store.send(:data_invalid?)).to eq true
      store = described_class.new(valid_api_response.except('url'))
      expect(store.send(:data_invalid?)).to eq true
      store = described_class.new(valid_api_response.except('title'))
      expect(store.send(:data_invalid?)).to eq true
      store = described_class.new(valid_api_response.except('type'))
      expect(store.send(:data_invalid?)).to eq true
    end
  end

  describe '#existing_article?' do
    it 'should return false if the article has not been persisted' do
      article = HackerNews::Articles::Store.(valid_api_response)
      new_data = valid_api_response.tap {|h| h['id'] = 2 }
      store = HackerNews::Articles::Store.new(new_data)
      expect(store.send(:existing_article?)).to eq false
    end
    it 'should return true if the article has been persisted' do
      article = HackerNews::Articles::Store.(valid_api_response)
      store = HackerNews::Articles::Store.new(valid_api_response)
      expect(store.send(:existing_article?)).to eq true
    end
  end

end
