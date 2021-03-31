Rails.application.routes.draw do
  resources :reviews
  # resources :users, only: [:create]
  post "/register", to: "users#create"
  post "/login", to: "user_auth#login"
  get "/auto_login", to: "user_auth#auto_login"
  get "/is_authed", to: "user_auth#is_authed"


  # get "/movies/search/:searchterm", to: 'movies#search'
  # resources :movies
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
