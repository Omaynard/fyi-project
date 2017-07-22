Rails.application.routes.draw do
  devise_for :users
	resources :businesses do 
		resources :likes
	end
	root 'businesses#index'
  end
