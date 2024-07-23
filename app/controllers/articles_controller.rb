class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.
                  includes(:users).
                  order(external_id: :desc).
                  page(params[:page])
  end
end
