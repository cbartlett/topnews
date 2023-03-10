class PostsController < ApplicationController
  before_action :update_posts, only: %i[index]

  def index
    @posts = Post.where(hacker_news_post_id: HackerNews.new.top_stories_ids.first(25)).includes(:favorites)
  end

  private

  def update_posts
    HackerNews.new.top_stories_ids.first(25).each do |story_id|
      post = Post.find_or_initialize_by(hacker_news_post_id: story_id)

      unless post.persisted?
        post.update_hacker_news_post
        post.save
      end
    end
  end
end
