Rails.application.routes.draw do
  root to: "users#index"

  devise_for :users
  resources :interviews
  resources :users, only: [:index, :show]
end
