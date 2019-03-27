Rails.application.routes.draw do
  root to: "getstarted#index"
  get 'getstarted/index'
  get '/auth/:provider/callback', to: 'getstarted#auth'
  get '/auth/failure', to: 'getstarted#failure'
  get 'block/index'
  get 'block/blocking'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
