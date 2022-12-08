class PagesController < ApplicationController
  def home
    @latest, @refetched = FeedFetch.get_latest
    @watched_stories = Story.watched_stories

    if @latest
      @stories = Story.includes(:user_stories).where(remote_id: @latest.ids)
    else
      @stories = []
    end
    @user = current_user
  end
end
