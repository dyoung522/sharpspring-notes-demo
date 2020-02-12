# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[new create]

  get :login, to: 'users#login'
  post :login, to: 'sessions#create'

  delete :logout, to: 'sessions#logout'

  root to: 'users#home'
end
