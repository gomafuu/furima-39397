Rails.application.routes.draw do
  # devise_for :orders
  # devise_for :purchases
  devise_for :items
  devise_for :users
  root to: 'items#index'
  resources :items
end
