Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  devise_for :users

  get 'users/unsubscribe/edit' => 'unsubscribes#edit'

  get 'users/unsubscribe' => 'unsubscribes#update'
  end
end
