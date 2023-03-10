# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#update_hacker_news_post' do
    context 'when response is complete' do
      hn_response = { 'id' => 123, 'title' => 'Example Title', 'score' => '42', 'by' => 'testperson', 'url' => 'http://example.com', 'time' => Time.now }
      before do
        allow_any_instance_of(HackerNews).to receive(:story).and_return(hn_response)
      end

      it 'is valid' do
        post = Post.create(hacker_news_post_id: 123)

        post.update_hacker_news_post

        expect(post.title).to eq('Example Title')
        expect(post.score).to eq('42')
        expect(post.by).to eq('testperson')
        expect(post.url).to eq('http://example.com')
        expect(post.time.utc.to_s).to eq(Time.now.utc.to_s)
      end
    end

    context 'when response is incomplete (missing url)' do
      hn_response = { 'id' => 123, 'title' => 'Example Title', 'score' => '42', 'by' => 'testperson', 'url' => nil,
                      'time' => Time.now }
      before do
        allow_any_instance_of(HackerNews).to receive(:story).and_return(hn_response)
      end

      it 'is valid' do
        post = Post.create(hacker_news_post_id: 123)

        post.update_hacker_news_post

        expect(post.title).to eq('Example Title')
        expect(post.score).to eq('42')
        expect(post.by).to eq('testperson')
        expect(post.url).to eq("https://news.ycombinator.com/item?id=#{post.hacker_news_post_id}")
        expect(post.time.utc.to_s).to eq(Time.now.utc.to_s)
      end
    end
  end
end
