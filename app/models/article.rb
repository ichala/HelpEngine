class Article < ApplicationRecord
  #title must be present and 5 - 100 chars long
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  #content must be present and 5 - 500 chars long
  validates :content, presence: true, length: { minimum: 5, maximum: 500 }

  def self.search_articles(params)
    # get 3 recent articles if no query is present or get articles that match the query
    params[:query].blank? ? all.order(id: :desc).limit(3) : where(
      "lower(title) LIKE :query OR lower(content) LIKE :query", query: "%#{params[:query].downcase}%"
    )
  end
end
