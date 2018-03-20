Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, :path_prefix => 'my'
    resources :users, only: [:index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :trips
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :trips do
        resources :reviews
      end
    end
  end
end
