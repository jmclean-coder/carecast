Rails.application.routes.draw do
  resources :affirmations
  resources :meals
  resources :metrics
  resources :journals
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/login", to: "login#new"
  post "/login", to: "login#verify", as: "verify"
  
  get "/signup", to: "users#new", as: "signup"

end
