# frozen_string_literal: true

Rails.application.routes.draw do
  resources :notes, except: %i[show]
  resources :sessions, only: %i[create destroy]
  resources :users, only: %i[new create]

  get :login, to: 'users#login', as: :login
  get :logout, to: 'sessions#destroy', as: :logout

  root to: 'notes#index'
end
