Rails.application.routes.draw do
	resources :tweets
	get '/search', to: 'tweets#search'
  root 'tweets#index'
end
