Rails.application.routes.draw do

  root to: 'site#index'
  get '/result', to: 'site#result'

  # get '/yelp', to: 'site#yelp_search'

  get '/typeform', to: 'typeform#intro_form'
  get '/work_typeform', to: 'typeform#work_typeform'
  get '/study_typeform', to: 'typeform#study_typeform'
  get '/travel_typeform', to: 'typeform#travel_typeform'

  post '/typeform_results', to: 'webhooks_handler#intro_form'
  post '/typeform_results2', to: 'webhooks_handler#travel_form'

end
