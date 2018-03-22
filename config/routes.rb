Rails.application.routes.draw do  
  root 'trips#index'
  devise_for :users
  get 'search_results' => 'trips#search_results', as: 'search_results'
  resources :users, only: [:index, :edit, :update, :destroy]

  resources :trips, :reviews, :votes, :admin

  namespace :admin do
    resources :trips
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :trips do
        resources :reviews do
          resources :votes, only: [:index, :create]
      end
    end
      resources :categories
    end
  end
end
