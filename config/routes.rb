# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root to: 'dashboards#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :dashboards
  resources :users do
    resources :exercises
  end
end
