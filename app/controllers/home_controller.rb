class HomeController < ApplicationController

  def index
    @query = params[:query]
    @articles = Article.search_articles(params)
  end


end
