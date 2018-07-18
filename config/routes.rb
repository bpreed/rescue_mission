Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :questions, except: [:show]

  resources :questions, only: [:show] do
    resources :answers, only: [:index, :create]
  end


end
