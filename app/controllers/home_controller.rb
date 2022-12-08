class HomeController < ApplicationController

  def index
    @articles = Article.search_by_title(params)
  end


end
