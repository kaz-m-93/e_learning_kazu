Rails.application.routes.draw do
  root "pages#home"
  get "/about", to: "pages#about"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create" # solution to url's change, if error occurs
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create" # solution to url's change, if error occurs
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#dashboard"

  resources :categories
  resources :words
  resources :users do
    resources :relationships
  end
  resources :lessons do
    resources :answers
  end
  namespace :admin do
    resources :users
    resources :categories do
      resources :words
    end
  end
  resources :sessions
end
