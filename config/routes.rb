RottenMangoes::Application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "users/new"
  get "users/create"
  resources :movies
  root to: 'movies#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
end
