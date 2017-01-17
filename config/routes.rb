Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :posts

  resources :users, only: [:show, :index]

  resources :likes, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :notifications, only: [:index, :destroy, :update]
  resources :categories

  # Page routes
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/privacy', to: 'pages#privacy_policy'
  get '/tos', to: 'pages#terms_of_service'

  # Following routes
  get '/user/following', to: 'friendships#following'
  get '/user/followers', to: 'friendships#followers'

end
