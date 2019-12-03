Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :orders, only: [:new, :create, :index, :show, :update] do
    resources :payments, only: :new
    resources :reviews, only: [:new, :create]
  end

  resources :stores, only: [:index, :show, :new, :create] do
    resources :store_reviews, only: [:new, :create]
    resources :products, only: :show do
      resources :product_orders
    end
  end

  get "dashboard", to: "pages#dashboard"

  namespace :store_manager do
    resources :stores do
      resources :days, only: [:edit,:update]
      resources :products
    end
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
