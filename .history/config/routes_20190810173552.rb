Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  devise_for :users do
    get '/' => '#index'
  end

  devise_for :admins

  get 'users/unsubscribes/edit' => 'unsubscribes#edit'

  get 'users/unsubscribes' => 'unsubscribes#update'

  get 'orders/check' => 'orders#check'

  resources :admin_users, only: [:index, :show, :edit, :update]

  resources :products, only: [:index, :show]

  resources :admin_products, except: [:create]

  resources :carts, only: [:index, :create, :update, :destroy]

  resources :orders, only: [:index, :new, :update]

  resources :admin_orders, only: [:index, :show, :update]

  resources :adresses, only: [:new, :create, :edit, :update]

  resources :consts, only: [:edit, :update]
end