class HackerNews
  BASE_URL = "https://hacker-news.firebaseio.com/v0"
  TOP_FRAGMENT = "/topstories.json"
  ITEM_TEMPLATE = "/item/%{id}.json"

  REFRESH_TIME = 10.minutes

  def top_stories
    uri = URI(BASE_URL + TOP_FRAGMENT)
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)
  end

  def get_item(id)
    uri = URI(BASE_URL + ITEM_TEMPLATE % { id: id })
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)
  end

end