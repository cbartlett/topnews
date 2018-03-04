class StoryController < ApplicationController
  before_action :authenticate_user!

  def star
    story_params[:starred] == "true" ? unstar_story : star_story
  end

  def star_story
    Story.new(title: story_params[:title], text: story_params[:text], hn_id: story_params[:hn_id], user_id: current_user.id).save
  end

  def unstar_story
    Story.where(hn_id: story_params[:hn_id], user_id: current_user.id).first.destroy
  end

  def starred
    @starred_stories = NewsFetcher.new(current_user).starred_stories
    render react_component: 'StarredStories', props: { starred_stories: @starred_stories, current_user: current_user}
  end

  def story_params
    params.require(:story).permit(:hn_id, :user_id, :starred, :title, :text)
  end
end
