Rails.application.routes.draw do
  root 'trips#index'
  devise_for :users
  resources :users, only: [:index, :destroy]
  
  resources :trips
    
  namespace :admin do
    resources :trips
    resources :users
  end
  
  namespace :api do
    namespace :v1 do
      resources :trips do
        resources :reviews
      end
      resources :categories
    end
  end
end
