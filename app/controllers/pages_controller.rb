class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @stories = HackerNews.new(current_user).fetch
    @current_user_name = "#{current_user.first_name} #{current_user.last_name}"
    render react_component: 'StoryListings', props: { stories: @stories, current_user: @current_user_name}
  end
end
