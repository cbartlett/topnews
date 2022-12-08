class UserStoriesController < ApplicationController

  def create
    UserStory.create!(params.permit(user_story: [ :user_id, :story_id])[:user_story])
    redirect_to "/"
  end

  def destroy
    UserStory.find(params.permit(:id)[:id]).destroy
    redirect_to "/"
  end
end
