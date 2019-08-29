Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  namespace :users do
    get '' => 'accounts#index'
    resource :unsubscribes, only: [:edit, :destroy]
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  resources :admin_users, only: [:index, :show, :edit, :update]

  resources :products, only: [:index, :show]

  resources :admin_products

  resources :carts, only: [:index, :create, :update, :destroy]


  resources :orders, only: [:index, :new, :update]
  namespace :orders do
    get 'check'
  end

  resources :admin_orders, only: [:index, :show, :update]

  resources :addresses, only: [:new, :create, :edit, :update, :destroy]

  resources :consts, only: [:update]
  namespace :consts do
    get 'edit'
  end
end