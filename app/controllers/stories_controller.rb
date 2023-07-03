class StoriesController < ApplicationController
  before_action :set_story, only: %i[ show picked ]

  # GET /stories or /stories.json
  def index
    @stories = Story.all
  end

  # GET /stories/1 or /stories/1.json
  def show
  end

  def picked
    begin
      current_user.stories << @story
    rescue ActiveRecord::RecordInvalid => invalid
      logger.info invalid.record.errors.messages
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def story_params
      params.require(:story).permit(:title, :author, :external_id, :time)
    end
end
