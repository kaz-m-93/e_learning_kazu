Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create' # solution to url's change, if error occurs
  get '/login', to: 'users#login'
  resources :users
end
