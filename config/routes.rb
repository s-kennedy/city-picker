Rails.application.routes.draw do
  root to: 'site#index'
  get '/yelp', to: 'site#yelp_search'
  get '/typeform', to: 'site#typeform'
  post '/typeform_results', to: 'site#results'
end
