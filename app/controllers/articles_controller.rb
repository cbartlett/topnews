class ArticlesController < ApplicationController

    def index
        @articles = Rails.cache.fetch(["top_stories_details"], expires_in: 4.hours) do 
            HackerNews.get_top_stories()
        end

        @liked_articles = (Article.has_likes.alphabetical.to_a).sort_by{|art| art.user_articles.count}.reverse
    end

    def liked_articles
        # sort liked articles by how many likes they have
        @articles = (Article.has_likes.alphabetical.to_a).sort_by{|art| art.user_articles.count}.reverse
    end


    def show
        @article = Article.find_by(:article_id => params[:id])
        if @article.nil? # the article has not been liked and therefore is not saved
            @article = HackerNews.get_details(params[:id])
            #raise "here"
        else
            #raise "here"
            #@article = Article.find_by(:article_id => params[:id])
            # set up @users_toggle for whether to show the like button to user (user cannot like same article multiple times)
            if !@article.user_articles.empty?
                @users_toggle = @article.user_articles.map{ |ua| ua.user }
            end
        end
    end

    def new
        @article = Article.new
    end

    def edit
    end

end