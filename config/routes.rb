Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :transactions, only: [:create, :edit, :update]
  resources :categories, only: [:create, :edit, :update]

  get '/dashboard', to: 'pages#dashboard'
  get '/expenses', to: 'pages#expenses'
  get '/recent_expenses', to: 'pages#recent_expenses'
  get '/monthly_subscriptions', to: 'pages#monthly_subscriptions'
  get '/subscriptions', to: 'pages#subscriptions'
  get '/categories', to: 'pages#categories'

  root 'pages#dashboard'
  get "up" => "rails/health#show", as: :rails_health_check
end
