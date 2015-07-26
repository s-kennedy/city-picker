Rails.application.routes.draw do

  root to: 'site#index'
  get '/result', to: 'site#result'

  get '/typeform', to: 'typeform#intro_form'
  post '/typeform_results', to: 'webhooks_handler#receive_results'

end
