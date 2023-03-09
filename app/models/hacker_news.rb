# frozen_string_literal: true

class HackerNews
  include HTTParty
  base_uri 'https://hacker-news.firebaseio.com/v0'

  def top_stories_ids
    self.class.get('/topstories.json')
  end

  def story(id)
    self.class.get("/item/#{id}.json")
  end
end
