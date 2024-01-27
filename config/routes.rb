# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories, only: [:index, :new, :create] do
    resources :payments, only: [:index, :new, :create], as: :payments
  end

  devise_for :users
  post '/categories/:category_id/payment' => 'payments#create', as: :create_payment
  resources :users, only: [:splash]

  get 'up' => 'rails/health#show', as: :rails_health_check

  authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  unauthenticated do
    root "users#splash", as: :unauthenticated_root
  end
end
