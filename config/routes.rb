Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'

  
  # API routes
  namespace :api do
  	namespace :v1 do
  		resources :tweets
  		resources :follows
  		resources :users, only: [:show] do
  			collection do
	  			get 'profile', action: 'profile'
	  			get 'tweets', action: 'tweets'
	  			get 'followers', action: 'followers'
	  			get 'followees', action: 'followees'
	  		end
  		end
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :home, only: [:index]
  root to: 'home#index'
end
