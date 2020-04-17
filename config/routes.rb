Rails.application.routes.draw do
  resources :affirmations
  resources :meals
  resources :metrics
  resources :journals
  resources :users
  resources :journal_entries
  root to: "login#new"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/login", to: "login#new"
  post "/login", to: "login#verify", as: "verify"
  get "/signup", to: "users#new", as: "signup"
  get "/dashboard", to: "users#show", as: "dashboard"
  get "/stats", to: "metrics#index", as: "stats"
  get "/stats/today", to: "metrics#today", as: "today"
  get "/stats/weekly", to: "metrics#weekly", as: "weekly"
  get "/stats/monthly", to: "metrics#monthly", as: "monthly"



end
