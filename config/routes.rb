Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users
  patch 'interviews', to: 'interviews#update_all'
  resources :interviews
  resources :users, only: [:index, :show]
end
