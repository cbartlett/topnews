# frozen_string_literal: true

class Post < ApplicationRecord
  def update_hacker_news_post
    hn = HackerNews.new
    self.hacker_news_post_id = hn.story(hacker_news_post_id)['id']
    self.title = hn.story(hacker_news_post_id)['title']
    self.score = hn.story(hacker_news_post_id)['score']
    self.by = hn.story(hacker_news_post_id)['by']
    self.url = hn.story(hacker_news_post_id)['url']
    self.time = Time.at(hn.story(hacker_news_post_id)['time'])
  end
end
