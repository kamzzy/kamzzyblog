# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users

  root 'users#index'
    resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { 
        registrations: 'api/v1/users/registrations',
        sessions: 'api/v1/users/sessions'
    }
      resources :users do
        resources :posts do
          resources :comments
          resources :likes
        end
      end
    end
  end
end
