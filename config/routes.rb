RottenMangoes::Application.routes.draw do
  get "users/new"
  get "users/create"
  resources :movies
  root to: 'movies#index'

  resources :users, only: [:new, :create]
end
