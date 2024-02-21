Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'pages#dashboard'
  get '/expenses', to: 'pages#expenses'
  get '/subscriptions', to: 'pages#subscriptions'

  root 'pages#dashboard'
  get "up" => "rails/health#show", as: :rails_health_check
end
