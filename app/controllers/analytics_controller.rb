class AnalyticsController < ApplicationController
  def index
    @searching_trends = Search.group(:query).pluck('query, count(query) as COUNT').sort_by{|x| x[1]}.reverse.first(5)
    @top_active_users = Search.group(:user_ip).pluck('user_ip, count(user_ip) as COUNT').sort_by{|x| x[1]}.reverse.first(3)
    @searches_per_day = Search.group('DATE(created_at)').count.sort_by{|x| x[0]}.reverse.first(7)
    ip = request.remote_ip
    @latest_searches_by_current_ip = Search.where(user_ip:ip).order(created_at: :desc).limit(20)
  end
end
