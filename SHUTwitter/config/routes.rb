Rails.application.routes.draw do
  get 'block/index'
  get 'block/blocking'
  root to: "getstarted#index"
  get 'getstarted/index'
  get '/auth/:provider/callback', to: 'block#index'
  get '/auth/failure', to: 'getstarted#failure'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
