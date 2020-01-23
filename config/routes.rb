Rails.application.routes.draw do
  get 'events_controller/new'
  get 'events_controller/show'
  get 'events_controller/all'
  get 'sessions/new'
  root 'main#index'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
