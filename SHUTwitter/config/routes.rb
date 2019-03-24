Rails.application.routes.draw do
  get 'getstarted/index'
	root to: "getstarted#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
