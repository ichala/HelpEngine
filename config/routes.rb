Rails.application.routes.draw do
  get "/analytics", to: 'analytics#index' , as: "analytics"
  # root path 
  root "home#index"
end
