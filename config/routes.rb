Rails.application.routes.draw do
  get 'posts/create'
  get 'notifications/index'
  root 'home#index'
  get 'home/index'
  devise_for :users
  resources :users, only: [:show] do
    resources :friendships, only: %i[create update destroy]
  end
  resources :searches
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
