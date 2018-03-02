require 'rest_client'

class NewsFetcher
  attr_reader :stories

  def initialize
  end

  def url
    ENV["HOME_URL"]
  end

  def retrieve
    response = RestClient.get(url)
    story_ids = JSON.parse(response.body)
    @stories = story_ids.map {|story_id| RestClient.get("https://hacker-news.firebaseio.com/v0/item/#{story_id}.json?print=pretty") }
    display_stories
  end

  def parsed_story
    @stories.map{|story| JSON.parse(story) }
  end

  def display_stories
    parsed_story.map { |parsed| { title: HTMLEntities.new.decode(parsed["title"]), text: HTMLEntities.new.decode(parsed["text"]) } }
  end
end
