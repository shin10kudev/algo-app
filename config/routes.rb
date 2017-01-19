Rails.application.routes.draw do
  root 'posts#index'

  # user routes
  devise_for :users
  resources :users, only: [:show, :index]

  # post routes
  resources :posts
  resources :categories
  resources :comments, only: [:create, :destroy]

  # other routes
  resources :likes, only: [:index, :create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :notifications, only: [:index, :destroy, :update]

  # page routes
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/privacy', to: 'pages#privacy_policy'
  get '/tos', to: 'pages#terms_of_service'

  # following routes
  get '/user/following', to: 'friendships#following'
  get '/user/followers', to: 'friendships#followers'

end
