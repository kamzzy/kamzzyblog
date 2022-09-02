# frozen_string_literal: true

Rails.application.routes.draw do
  resources :roles
  devise_for :users
  scope '/admin' do
    resources :users
  end
  root 'users#index'
    resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end
