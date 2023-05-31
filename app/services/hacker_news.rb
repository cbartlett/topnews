require 'json'

class HackerNews
    def self.get_top_stories
        url = "https://hacker-news.firebaseio.com/v0/topstories.json"
        response = RestClient.get(url)
        articles_ids = JSON.parse(RestClient.get("https://hacker-news.firebaseio.com/v0/topstories.json")).slice(0, 50)
        res = articles_ids.map { |article_id| get_details(article_id) }.to_a
        # sort top stories by score
        res.sort_by {|art| art.score }.reverse
    end

    def self.get_details(article_id)
        response = RestClient.get("https://hacker-news.firebaseio.com/v0/item/" + article_id.to_s + ".json")
        @article = Article.new() 
        @article.title = JSON.parse(response)['title']
        @article.author = JSON.parse(response)['by']
        @article.score = JSON.parse(response)['score']
        @article.url = JSON.parse(response)['url']
        @article.article_id = article_id

        return @article
    end 

end