# frozen_string_literal: true

Rails.application.routes.draw do
  get 'person/index' => 'person#index'
  get 'users' => 'users#index'
  get 'users/:id' => 'users#show'
  get 'posts' => 'posts#index'
  get 'posts/:id' => 'posts#show'
end
