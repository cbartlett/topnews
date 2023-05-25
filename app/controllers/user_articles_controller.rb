class UserArticlesController < ApplicationController

    def like
        @user_article = UserArticle.new()

        # only save article if it hasn't been liked before
        @article = Article.find_by(:article_id => params[:id])

        if @article.nil?
            @article = Article.new()
            response = RestClient.get("https://hacker-news.firebaseio.com/v0/item/" + params[:id].to_s + ".json")
            @article.title = JSON.parse(response)['title']
            @article.author = JSON.parse(response)['by']
            @article.score = JSON.parse(response)['score']
            @article.url = JSON.parse(response)['url']
            @article.article_id = params[:id]
            if @article.save
                flash[:notice] = "Successfully liked the article"

                @user_article.article = @article
                @user_article.user = current_user
                if @user_article.save
                    flash[:notice] = "Successfully liked the article"
                    redirect_to article_path(@article.article_id)
                else 
                    redirect_to action: "index"
                end
            end
        else
            # if the article already exists
            @user_article.article = @article
            @user_article.user = current_user
            if @user_article.save
                flash[:notice] = "Successfully liked the article"
                redirect_to article_path(@article.article_id)
            else 
                redirect_to action: "index"
            end
        end
            
    end

    def unlike
        @article = Article.find_by(:article_id => params[:id])
        @user_article = UserArticle.find_by(:user => current_user, :article => @article)
        @user_article.destroy
        flash[:notice] = "Successfully unliked article"
        redirect_to article_path(@article.article_id)
    end


end