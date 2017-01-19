Rails.application.routes.draw do
  root 'posts#index'

  # user routes
  devise_for :users
  resources :users, only: [:show, :index]
  resources :notifications, only: [:index, :destroy, :update]

  # post routes
  resources :posts
  resources :categories
  resources :comments, only: [:create, :destroy]

  # like routes
  resources :likes, only: [:create, :destroy]
  get '/user/likes', to: 'likes#favorites'

  # page routes
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/privacy', to: 'pages#privacy_policy'
  get '/tos', to: 'pages#terms_of_service'

  # friendship routes
  resources :friendships, only: [:create, :destroy]
  get '/user/following', to: 'friendships#following'
  get '/user/followers', to: 'friendships#followers'

end
