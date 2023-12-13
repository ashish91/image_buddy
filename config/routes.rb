Rails.application.routes.draw do
  devise_for :users

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
    collection do
      get :feeds
      get :posts
      get :comments
      get :about
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "posts#index"
end
