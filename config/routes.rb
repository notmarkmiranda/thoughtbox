Rails.application.routes.draw do
  root "pages#show"
  resources :users, only: [:new, :create]
  resources :links, only: [:index]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
