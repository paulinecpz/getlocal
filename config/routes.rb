Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :orders, only: [:show] do
    resources :reviews, only: [:new, :create]
  end

  resources :stores, only: [:index, :show] do
    resources :products, only: :show do
      resources :orders, only: [:new, :create]
    end
  end

  namespace :admin do
    resources :stores do
      resources :days, only: [:edit,:update]
      resources :products
    end
  end
  get "dashboard", to: "pages#dashboard", as: :dashboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
