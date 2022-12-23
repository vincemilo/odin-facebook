# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :users, only: [:show] do
    resources :friendships, only: %i[create update destroy]
  end
  resources :searches
  resources :posts do
    resources :comments
  end
  resources :notifications
  resources :likes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
