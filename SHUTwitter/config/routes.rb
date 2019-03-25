Rails.application.routes.draw do
	#root to: "getstarted#index"
	root to: 'sessions#index'
  get 'sessions/index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sessions/create'
  get 'getstarted/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
