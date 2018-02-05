Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users
  patch 'interviews', to: 'interviews#update_all'
  resources :interviews
  resources :users, only: [:index, :show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end
