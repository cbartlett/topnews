class ArticlesController < ApplicationController

    def index
        @articles = Rails.cache.fetch(["top_stories_details"], expires_in: 4.hours) do 
            top_stories
        end
    end

    def top_stories
        url = "https://hacker-news.firebaseio.com/v0/topstories.json"
        response = RestClient.get(url)
        articles_ids = JSON.parse(RestClient.get("https://hacker-news.firebaseio.com/v0/topstories.json")).slice(0, 100)
        res = articles_ids.map { |article_id| get_details(article_id) }.to_a
        # sort top stories by score
        return res.sort_by {|art| art.score }.reverse
    end

    def liked_articles
        # sort liked articles by how many likes they have
        @articles = (Article.has_likes.alphabetical.to_a).sort_by{|art| art.user_articles.count}.reverse
    end

    def get_details(article_id)
        response = RestClient.get("https://hacker-news.firebaseio.com/v0/item/" + article_id.to_s + ".json")
        @article = Article.new() 
        @article.title = JSON.parse(response)['title']
        @article.author = JSON.parse(response)['by']
        @article.score = JSON.parse(response)['score']
        @article.url = JSON.parse(response)['url']
        @article.article_id = article_id


        return @article
    end

    def show
        @article = Article.find_by(:article_id => params[:id])

        # set up @users_toggle for whether to show the like button to user (user cannot like same article multiple times)
        if !@article.user_articles.empty?
            @users_toggle = @article.user_articles.map{ |ua| ua.user }
        end
    end

    def new
        @article = Article.new
    end

    def edit
    end

end