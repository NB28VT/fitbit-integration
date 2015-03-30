Rails.application.routes.draw do
  resources :dashboard, only: [:index]
  resources :user, only: [:index]
end
