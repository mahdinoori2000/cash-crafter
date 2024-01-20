# frozen_string_literal: true

Rails.application.routes.draw do
  get '/categories/:category_id/payment' => 'payments#index', as: :category_payments
  get '/categories/:category_id/payment/new' => 'payments#new', as: :new_payment
  post '/categories/:category_id/payment' => 'payments#create', as: :create_payment
  devise_for :users
  resources :payments
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  unauthenticated do
    root "users#splash", as: :unauthenticated_root
  end
end
