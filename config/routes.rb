Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get "sessions/new"
  root "static_pages#index"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "user", to: "users#index"
  get "category", to: "category#index"
  namespace :admin do
    resources :users
    resources :category
    resources :product
  end
  resources :users
  resources :static_pages
  resources :product, only: [:show]
  resources :line_items
  resources :carts
end
