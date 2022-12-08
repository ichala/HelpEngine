Rails.application.routes.draw do
  # root path 
  post "/search", to: "articles#search", as: "search_articles"
  root "home#index"
end
