Rails.application.routes.draw do
  get 'sessions/new'
  root 'main#index'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :events
  resources :user_events, only: [:create, :destroy]
  
end
