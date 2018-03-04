require 'rest_client'

class HackerNews
  attr_reader :stories

  def initialize(current_user)
    @current_user = current_user
  end

  def fetch
    response = RestClient.get(url)
    story_ids = JSON.parse(response.body)
    @stories = story_ids.map {|story_id| RestClient.get("https://hacker-news.firebaseio.com/v0/item/#{story_id}.json?print=pretty") }
    stories_json
  end

  def url
    ENV["HOME_URL"]
  end

  def stories_json
    parsed_story.map { |parsed|
      {
        title: sanitize(parsed["title"]),
        text: sanitize(parsed["text"]),
        starred: starred(parsed["id"]),
        hn_id: parsed["id"],
        users_starred: users_starred(parsed["id"]),
        current_user_name: "#{@current_user.first_name} #{@current_user.last_name}"
      }
    }
  end

  def parsed_story
    @stories.map{|story| JSON.parse(story) }
  end

  def sanitize(txt)
    Nokogiri::HTML.parse(txt).text
  end

  def starred(id)
    Story.where(hn_id: id, user_id: @current_user.id).any?
  end

  def users_starred(id)
    Story.where(hn_id: id).map(&:user_id).map {|id| user = User.find(id); "#{user.first_name} #{user.last_name}" }.join(" ")
  end
end
