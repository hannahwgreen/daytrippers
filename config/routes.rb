Rails.application.routes.draw do  
  root 'trips#index'
  devise_for :users, :path_prefix => 'my'
  get 'search_results' => 'trips#search_results', as: 'search_results'
  resources :users, only: [:index, :edit, :update, :destroy]
  resources :trips
  resources :admin
  resources :reviews
  
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
