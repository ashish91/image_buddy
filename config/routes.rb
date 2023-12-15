require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :roles

      root to: "users#index"
    end
  devise_for :users

  # mount Sidekiq::Web in your Rails app
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :tags
  resources :posts do
    collection do
      get :search
    end
  end
  resources :images

  resources :comments, only: [:create]
  resources :likes, only: [] do
    collection do
      post :upvote
      post :downvote
    end
  end

  resources :users, only: [] do
    member do
      get :feeds
      get :posts
      get :comments
      get :about
    end
  end

  resources :relationships, only: [] do
    member do
      post :follow
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "posts#index"
end
