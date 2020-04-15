Rails.application.routes.draw do
  resources :affirmations
  resources :meals
  resources :metrics
  resources :journals
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
