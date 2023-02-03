# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: %i[index show] do
    resources :friendships, only: %i[create update destroy]
  end
  resources :searches
  resources :posts do
    resources :comments
  end
  resources :notifications
  resources :likes

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
