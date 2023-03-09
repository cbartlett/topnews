# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#update_hacker_news_post' do
    hn_response = { 'id' => 123, 'title' => 'Example Title', 'score' => '42', 'by' => 'testperson', 'url' => 'http://example.com', 'time' => Time.now }

    before do
      allow_any_instance_of(HackerNews).to receive(:story).and_return(hn_response)
    end

    it 'updates the post with data from the Hacker News API' do
      post = Post.create(hacker_news_post_id: 123)

      post.update_hacker_news_post

      expect(post.title).to eq('Example Title')
      expect(post.score).to eq('42')
      expect(post.by).to eq('testperson')
      expect(post.url).to eq('http://example.com')
      expect(post.time.utc.to_s).to eq(Time.now.utc.to_s)
    end
  end
end
