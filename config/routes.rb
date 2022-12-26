# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :dashboards

  # Defines the root path route ("/")
  root to: 'dashboards#index'
end
