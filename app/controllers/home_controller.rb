class HomeController < ApplicationController

  def index
    @articles = Article.search_articles(params)
    ip = request.ip
    @query = params[:query]
    save_search(@query, ip)
  end

  def save_search(query, ip)
    return if query.nil? || query.length < 3
    current_search = Search.new(query: query, user_ip: ip)
    recent_saved_search = Search.where(user_ip: ip).last
    if recent_saved_search.nil?  || !recent_saved_search.similarity?(query)
      current_search.save
    elsif recent_saved_search.query.length < query.length
      recent_saved_search.update(query: query)
    end
  end


end
