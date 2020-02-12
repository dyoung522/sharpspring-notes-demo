# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :sessions, only: %i[create destroy]

  get :login, to: 'users#login', as: :login
  get :logout, to: 'sessions#destroy', as: :logout

  root to: 'users#home'
end
