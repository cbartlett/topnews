class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @stories = NewsFetcher.new().retrieve
  end
end
