Rails.application.routes.draw do
  root to: 'site#index'
  get '/yelp', to: 'site#yelp_search'
end
