Rails.application.routes.draw do

  
  resources :tv_show_reviews
  resources :reviews
  
  post "/register", to: "users#create"
  post "/login", to: "user_auth#login"
  get "/auto_login", to: "user_auth#auto_login"
  get "/is_authed", to: "user_auth#is_authed"

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
