class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index

  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new

    # Parse Hacker News API
    url = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
    stories_ids = JSON.parse(RestClient.get(url))

    @stories = []

    # Fill stories array with stories
    stories_ids.each do |id|
      if !News.find_by_news_id(id)
        story_url = "https://hacker-news.firebaseio.com/v0/item/#{id}.json?print=pretty"
        story = JSON.parse(RestClient.get(story_url))
        @stories << story
      end
      break if @stories.length >= 5
    end  

    # Get votes for each story
    @news_all = News.all
    @starred_by = {}
    @news_all.each do |news|
      news.votes_for.up.by_type(User).voters.each do |user|
        if @starred_by[news.id]
          @starred_by[news.id] += ", #{user.first_name} #{user.last_name}"
        else
          @starred_by[news.id] = "#{user.first_name} #{user.last_name}"
        end
      end
    end
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @story_exists = News.find_by_title(params[:news][:title])
    if @story_exists
      @story_exists.vote_by :voter => current_user
      redirect_to root_path
    else
      @news = News.new(news_params)
      respond_to do |format|
        if @news.save
          @news.vote_by :voter => current_user
          format.html { redirect_to root_path, notice: 'Story was successfully voted.' }
          format.json { render :show, status: :created, location: @news }
        else
          format.html { render :new }
          format.json { render json: @news.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :news_id, :url)
    end
end
