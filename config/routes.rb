Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  resources :products,   only: :index
  resources :line_items, only: :create
  resources :orders,     only: :index

  resources :charges,    only: %i[new create]
end
