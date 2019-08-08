Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  devise_for :users
  devise_for :admins

  get 'users' => 'users#index'

  get 'users/unsubscribes/edit' => 'unsubscribes#edit'

  get 'users/unsubscribes' => 'unsubscribes#update'

  get 'orders/check' => 'orders#check'

  resouces :admin_users, only: [:index, :show, :edit, :update]

  resouces :products, only: [:index, :show]

  resouces :admin_products, except: [:create]

  resouces :carts, only: [:index, :create, :update, :destroy]

  resouces :orders, only: [:index, :new, :update]

  resouces :admin_orders, only: [:index, :show, :update]

  resouces :adresses, only: [:new, :create, :edit, :update]

  resouces :consts, only: [:edit, :update]
end
end