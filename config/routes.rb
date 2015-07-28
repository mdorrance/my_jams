Rails.application.routes.draw do
  resources :users
  resources :songs
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  root to: "songs#index"
end
