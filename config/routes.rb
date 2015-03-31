Rails.application.routes.draw do
  devise_for :users
  root to: "user#index"
  resources :dashboard, only: [:index]
  resources :user, only: [:index]
end
