Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :posts

  resources :users, only: [:show, :index]

  resources :likes, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :notifications, only: [:index, :destroy, :update]

  # Page routes
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  # Following routes
  get '/user/following', to: 'friendships#following'
  get '/user/followers', to: 'friendships#followers'

end
