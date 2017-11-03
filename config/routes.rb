Rails.application.routes.draw do
  
  root to: 'dashboard#index'
  
  resources :users  do
    get :cancel
  end
  
  resources :books do
    get :cancel
  end
  
  resources :categories do
    get :cancel
  end
  
end
