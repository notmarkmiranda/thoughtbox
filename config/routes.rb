Rails.application.routes.draw do
  root "links#index"
  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
