class UsersArticlesController < ApplicationController
  before_action :authenticate_user!

  def create
    # This should be extracted into a service
    user_article = UsersArticle.find_by(user_id: current_user.id, article_id: params[:article_id])
    liked = if user_article
              user_article.destroy
              false
            else
              UsersArticle.create!(user_id: current_user.id, article_id: params[:article_id])
              true
            end

    render json: { liked: liked }
  end
end
