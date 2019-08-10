Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  devise_for :users

  get 'users/unsubscribes/edit' => 'unsubscribes#edit'

  get 'users/unsubscribes' => 'unsubscribes#update'

  get 'orders/check' => 'orders#check'

  end
end