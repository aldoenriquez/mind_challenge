Rails.application.routes.draw do
  resources :accounts
  resources :users

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  root "dashboard#index"
end
