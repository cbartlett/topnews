class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.includes(:post)
  end

  def create
    @post = Post.find(params[:post_id])
    @favorites = current_user.favorites.new(user_id: current_user.id, post_id: @post.id)

    if @favorites.save
      flash[:success] = 'Post favorited!'
    else
      flash[:error] = 'Post was not favorited!'
    end

    redirect_to favorites_path
  end

  def destroy
    @favorite = Favorite.find(params[:id])

    authorize(@favorite)

    if @favorite.destroy
      flash[:success] = 'Post deleted!'
    else
      flash[:error] = 'Post was not deleted!'
    end

    redirect_to root_path
  end
end
