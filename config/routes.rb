Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'
  get 'admin/delete_items', to: 'admin#delete_items'

  resources :items do
    resources :purchases
  end

end
