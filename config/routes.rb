Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  devise_for :users
  resources :users, only: [:index] do
    resource :unsubscribes, only: [:edit, :update]
  end

  devise_for :admins

  resources :admin_users, only: [:index, :show, :edit, :update]

  resources :products, only: [:index, :show]

  resources :admin_products, except: [:create]

  resources :carts, only: [:index, :create, :update, :destroy]

  resources :orders, only: [:index, :new, :update]
  get 'orders/check'

  resources :admin_orders, only: [:index, :show, :update]

  resources :adresses, only: [:new, :create, :edit, :update]

  resources :consts, only: [:edit, :update]
end