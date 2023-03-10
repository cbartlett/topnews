# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  def update_hacker_news_post
    hn = HackerNews.new
    self.hacker_news_post_id = hn.story(hacker_news_post_id)['id']
    self.title = hn.story(hacker_news_post_id)['title']
    self.score = hn.story(hacker_news_post_id)['score']
    self.by = hn.story(hacker_news_post_id)['by']
    self.time = Time.at(hn.story(hacker_news_post_id)['time'])
    self.url = hacker_news_url(hn.story(hacker_news_post_id)['url'])
  end

  def hacker_news_url(url)
    if url.nil?
      "https://news.ycombinator.com/item?id=#{hacker_news_post_id}"
    else
      url
    end
  end
end
