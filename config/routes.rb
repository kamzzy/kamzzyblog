# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
