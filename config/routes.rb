Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # root 'groups#index'
  get 'welcome' => 'welcome#index'
  resources :groups do
  	member do
  		post :join
  		post :quit
  	end
  	resources :posts
  end
  
  namespace :account do
  	resources :groups
  end

end
