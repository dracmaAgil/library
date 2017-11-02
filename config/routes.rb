Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :users
  resources :books
  resources :categories
end
